# Tradutor VM (nand2tetris) → RISC-V RV32I

Documentação das decisões de design e das expansões de cada comando `.vm` para assembly RV32I, com alvo de execução no **FPGRARS**.

---

## 1. Visão geral

| Item | Decisão |
|---|---|
| ISA | RV32I (sem extensão M; não há `mul`/`div` nativos) |
| Alvo | FPGRARS (compatível com a sintaxe do RARS) |
| Palavra da VM | 32 bits (4 bytes) |
| Crescimento da pilha | **Para cima** (igual ao Hack) |
| `true` / `false` | `-1` (`0xFFFFFFFF`) / `0` |
| Ponteiros de segmento | Em registradores (não em RAM[1..4]) |
| `temp` e `static` | Em memória, alocados em `.data` |
| Ponteiros da VM (`pointer`, arrays, objetos) | **Endereços de palavra** numa RAM de 32K palavras (`ram`, base em `s4`) |

---

## 2. Decisões de design

### 2.1 Tamanho da palavra: 32 bits

Cada slot da pilha ocupa 4 bytes. Consequências:

- `SP` avança de 4 em 4 (`addi sp, sp, 4`).
- O segmento `seg i` fica em `base + 4*i`.
- Valores de 16 bits do Hack cabem sem perda. A aritmética agora é de 32 bits, então overflow e wrap-around **não** se comportam como no Hack (ver seção 9).

### 2.2 Pilha cresce para cima

Contra a convenção do RISC-V, mas igual ao Hack. Motivo: a spec do nand2tetris assume `argument i = ARG + i` e o frame do `call` é montado em ordem crescente. Com pilha descendente, tudo viraria `ARG - 4*i` e o `call`/`return` ficaria invertido.

Custo: perde-se compatibilidade de ABI com código C compilado. Não importa para um tradutor VM.

### 2.3 Ponteiros de segmento em registradores

No Hack, `LCL/ARG/THIS/THAT` vivem em RAM[1..4] e cada acesso exige carregar o ponteiro. Com 32 registradores, ficam permanentemente em registradores callee-saved, e `push local i` vira um único `lw`.

### 2.3.1 Ponteiros da VM são endereços de palavra

O código VM gerado pelo compilador Jack faz aritmética de ponteiros em **palavras**: `a[i]` vira `push a` / `push i` / `add` / `pop pointer 1` / `push that 0`, e `Memory.alloc` devolve índices de palavra. Se `THIS`/`THAT` guardassem o endereço em bytes, `a + i` andaria `i` bytes em vez de `i` palavras, e `push constant 3030` / `pop pointer 0` (PointerTest) apontaria para um endereço inválido.

Solução: a VM enxerga uma RAM de 32K palavras (`ram: .space 131072`, endereços Hack 0..32767), com a base num registrador reservado (`s4`). A conversão acontece **só** em `push/pop pointer`:

- `pop pointer 0`: `s2 = s4 + 4*valor`
- `push pointer 0`: empilha `(s2 - s4) / 4`

Assim `push/pop this i` continua sendo um único `lw`/`sw` com `off(s2)`. `LCL` e `ARG` não passam por isso: eles nunca aparecem como valores para o código VM (só são salvos e restaurados nos frames), então continuam sendo endereços em bytes da pilha.

### 2.4 `true = -1`

Mantém `and`/`or`/`not` corretos como operações bit a bit, igual ao Hack (o OS do nand2tetris depende disso).

### 2.5 Comparações sem branch

`eq`, `lt`, `gt` usam `slt`/`sltiu` + negação. Sem labels, expansão de tamanho fixo, sem contador de labels.

### 2.6 Sem dependência de pseudo-instruções frágeis

Para acessar símbolos (`static`), usa-se sempre `la` + `lw`/`sw`, em vez de `lw rd, símbolo`. O `la`, `li`, `mv`, `j`, `jr`, `beqz`, `bnez` são pseudo-instruções básicas do RARS e do FPGRARS.

### 2.7 Pilha e `temp` alocados em `.data`

Em vez de chumbar endereços (`STACK_BASE = 0x...`), reserva-se espaço com `.space` e usa-se `la` no bootstrap. Assim o assembler resolve os endereços e o código não depende do layout de memória do simulador.

> **Verificado no FPGRARS v2.3 e no RARS 1.6:** o `.data` com `ram` (128 KiB) + pilha (64 KiB) cabe, e o ecall 10 (exit) funciona. O FPGRARS coloca o `.data` num endereço diferente do RARS, então nada pode depender de endereços fixos.

### 2.8 Sem labels numéricos

Nem o RARS nem o FPGRARS aceitam labels locais numéricos (`1:` / `1f` / `1b`). Todos os labels internos têm nome único (ver 7.1). Já `.` e `$` em nomes de label são aceitos pelos dois.

### 2.9 `jalr x0, t1, 0` em vez de `jr t1`

O FPGRARS v2.3 monta a pseudo-instrução `jr rs` como `jalr rs, x0, 0`, ou seja, **salta para o endereço 0** (e reinicia o programa) em vez de saltar para `rs`. Por isso o `return` usa a forma explícita `jalr x0, t1, 0`, que funciona igual nos dois simuladores. Não use `jr` em código escrito à mão para o FPGRARS.

---

## 3. Mapeamento de registradores

| Hack | Função | RV32I | Nome ABI |
|---|---|---|---|
| RAM[0] `SP` | topo da pilha | `x2` | `sp` |
| RAM[1] `LCL` | base de `local` | `x8` | `s0` |
| RAM[2] `ARG` | base de `argument` | `x9` | `s1` |
| RAM[3] `THIS` | base de `this` / `pointer 0` | `x18` | `s2` |
| RAM[4] `THAT` | base de `that` / `pointer 1` | `x19` | `s3` |
| RAM[5..12] `temp` | `temp 0..7` | memória, base em `x4` | `tp` |
| `D`, `A`, R13–R15 | scratch | `x5`, `x6`, `x7` | `t0`, `t1`, `t2` |
| `static` | `Arquivo.i` | símbolos em `.data` | — |
| — | base da RAM da VM (`ram`) | `x20` | `s4` |

Regras:

- `s0`–`s4`, `sp` e `tp` são **reservados** pelo tradutor. Código gerado nunca os usa para outra coisa.
- `t0`–`t2` são scratch: não preservam valor entre comandos VM.
- `tp` é usado como base de `temp` por não ser tocado pelo assembler (ao contrário do `gp`, que pode sofrer relaxation).
- `ra` **não é usado**: o endereço de retorno fica no frame (spec do nand2tetris).

---

## 4. Macros base

### PUSH `t0`

```asm
sw   t0, 0(sp)
addi sp, sp, 4
```

### POP → `t0`

```asm
addi sp, sp, -4
lw   t0, 0(sp)
```

---

## 5. Comandos de acesso à memória

`i` é o índice do comando VM. `off = 4*i`.

### 5.1 `push`

| VM | RV32I |
|---|---|
| `push constant n` | `li t0, n` + PUSH |
| `push local i` | `lw t0, off(s0)` + PUSH |
| `push argument i` | `lw t0, off(s1)` + PUSH |
| `push this i` | `lw t0, off(s2)` + PUSH |
| `push that i` | `lw t0, off(s3)` + PUSH |
| `push temp i` | `lw t0, off(tp)` + PUSH |
| `push pointer 0` | `sub t0, s2, s4` / `srai t0, t0, 2` + PUSH |
| `push pointer 1` | `sub t0, s3, s4` / `srai t0, t0, 2` + PUSH |
| `push static i` | `la t1, Arq.i` / `lw t0, 0(t1)` + PUSH |

Exemplo, `push constant 7`:

```asm
li   t0, 7
sw   t0, 0(sp)
addi sp, sp, 4
```

Otimização: se `n == 0`, `sw x0, 0(sp)` dispensa o `li`.

### 5.2 `pop`

| VM | RV32I |
|---|---|
| `pop local i` | POP + `sw t0, off(s0)` |
| `pop argument i` | POP + `sw t0, off(s1)` |
| `pop this i` | POP + `sw t0, off(s2)` |
| `pop that i` | POP + `sw t0, off(s3)` |
| `pop temp i` | POP + `sw t0, off(tp)` |
| `pop pointer 0` | POP + `slli t0, t0, 2` / `add s2, s4, t0` |
| `pop pointer 1` | POP + `slli t0, t0, 2` / `add s3, s4, t0` |
| `pop static i` | POP + `la t1, Arq.i` / `sw t0, 0(t1)` |

Exemplo, `pop argument 2`:

```asm
addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s1)
```

### 5.3 Limite do offset

O imediato de `lw`/`sw` tem 12 bits com sinal (−2048..2047), então `4*i` só cabe para `i ≤ 511`. Para `i` maior:

```asm
li   t1, 4*i
add  t1, t1, s0        # s0/s1/s2/s3/tp conforme o segmento
lw   t0, 0(t1)         # ou sw t0, 0(t1) no pop
```

### 5.4 `static`

Cada `static i` do arquivo `Arq.vm` vira o símbolo `Arq.i` em `.data`. O tradutor deve coletar todos os símbolos usados e emitir:

```asm
.data
Arq.0: .word 0
Arq.1: .word 0
```

---

## 6. Aritmética e lógica

### 6.1 Binárias

`x` = segundo elemento da pilha, `y` = topo. O `sp` é mexido uma vez só:

```asm
lw   t1, -4(sp)        # y
lw   t0, -8(sp)        # x
<op>
sw   t0, -8(sp)
addi sp, sp, -4
```

| VM | `<op>` | Resultado |
|---|---|---|
| `add` | `add t0, t0, t1` | x + y |
| `sub` | `sub t0, t0, t1` | x − y |
| `and` | `and t0, t0, t1` | x & y |
| `or` | `or t0, t0, t1` | x \| y |
| `eq` | `sub t0, t0, t1` / `sltiu t0, t0, 1` / `sub t0, x0, t0` | −1 se x = y, senão 0 |
| `lt` | `slt t0, t0, t1` / `sub t0, x0, t0` | −1 se x < y, senão 0 |
| `gt` | `slt t0, t1, t0` / `sub t0, x0, t0` | −1 se x > y, senão 0 |

Como funciona a conversão para `-1`: `slt`/`sltiu` retornam `1` ou `0`; `sub t0, x0, t0` transforma `1 → -1` e mantém `0`.

### 6.2 Unárias

Não mexem no `sp`:

```asm
lw   t0, -4(sp)
<op>
sw   t0, -4(sp)
```

| VM | `<op>` |
|---|---|
| `neg` | `sub t0, x0, t0` |
| `not` | `xori t0, t0, -1` |

---

## 7. Fluxo de controle e funções

### 7.1 Nomes de labels

Os labels do assembly são derivados para não colidirem entre funções:

| Origem | Label gerado |
|---|---|
| `function Main.foo k` | `Main.foo` |
| `label L` dentro de `Main.foo` | `Main.foo$L` (como no Hack) |
| `label L` fora de função (arquivo `Arq.vm`) | `Arq$L` |
| retorno de `call` (contador global `N`) | `Main.foo__ret_N` |
| desvio interno do `if-goto` (contador global `N`) | `Main.foo__skip_N` |
| laço de zerar locais (`k` grande) | `Main.foo__init_loop` / `Main.foo__init_end` |

Labels do usuário levam `$` e os internos levam `__`, então não colidem. Caracteres fora de `[A-Za-z0-9_.$]` (ex.: `:`) viram `_`.

### 7.2 `label`, `goto`, `if-goto`

| VM | RV32I |
|---|---|
| `label L` | `Func$L:` |
| `goto L` | `j Func$L` |
| `if-goto L` | POP + `beqz t0, Func__skip_N` / `j Func$L` / `Func__skip_N:` |

O `if-goto` sempre usa a forma com `j` (alcance ±1 MiB): um `bnez` direto alcança só ±4 KiB, o que uma função grande ultrapassa, e nenhum dos dois assemblers expande o desvio sozinho.

### 7.3 `function f k`

```asm
f:
  sw   x0, 0(sp)       # repete k vezes, offsets 0, 4, 8, ...
  sw   x0, 4(sp)
  ...
  addi sp, sp, 4*k     # ajusta o sp uma vez só
```

Para `k` grande (`4*k > 2047`), use um laço em vez de desenrolar:

```asm
f:
  li   t0, k
f__init_loop:
  beqz t0, f__init_end
  sw   x0, 0(sp)
  addi sp, sp, 4
  addi t0, t0, -1
  j    f__init_loop
f__init_end:
```

Na entrada da função, `sp == s0` (LCL), então os `k` locais ficam em `0..4*(k-1)(s0)`.

### 7.4 `call f n`

`N` é um contador único por chamada.

```asm
  la   t0, Func__ret_N
  sw   t0, 0(sp)         # endereço de retorno
  sw   s0, 4(sp)         # LCL
  sw   s1, 8(sp)         # ARG
  sw   s2, 12(sp)        # THIS
  sw   s3, 16(sp)        # THAT
  addi sp, sp, 20
  addi s1, sp, -(20+4*n) # ARG = SP - 5 - n
  mv   s0, sp            # LCL = SP
  j    f
Func__ret_N:
```

Layout do frame (relativo a `LCL`, que aponta logo após o frame):

| Offset de LCL | Conteúdo |
|---|---|
| −20 | endereço de retorno |
| −16 | LCL salvo |
| −12 | ARG salvo |
| −8 | THIS salvo |
| −4 | THAT salvo |

Se `20+4*n` passar de 2047, calcule com `li t1, 4*n+20` / `sub s1, sp, t1`.

### 7.5 `return`

```asm
  mv   t0, s0            # FRAME = LCL
  lw   t1, -20(t0)       # RET (lido ANTES de sobrescrever *ARG)
  lw   t2, -4(sp)        # valor de retorno (topo da pilha)
  sw   t2, 0(s1)         # *ARG = valor de retorno
  addi sp, s1, 4         # SP = ARG + 1
  lw   s3, -4(t0)        # THAT
  lw   s2, -8(t0)        # THIS
  lw   s1, -12(t0)       # ARG
  lw   s0, -16(t0)       # LCL
  jalr x0, t1, 0         # = jr t1 (ver 2.9)
```

A ordem importa:

1. `RET` precisa ser lido antes do `sw t2, 0(s1)`: quando `n = 0`, `*ARG` é exatamente o slot do endereço de retorno.
2. `sp` é calculado a partir de `s1` antes de `s1` ser restaurado.
3. O `FRAME` fica em `t0` porque `s0` (LCL) é restaurado por último.

---

## 8. Bootstrap e estrutura do arquivo `.s`

O tradutor gera um único arquivo `.s` (um `.vm` → `Arq.s` ao lado dele; uma pasta → `Pasta.s` ao lado da pasta):

```asm
.data
temp_base:  .space 32            # temp 0..7
Class1.0:   .word 0              # statics usados, de todos os arquivos
ram:        .space 131072        # RAM da VM: 32K palavras (seção 2.3.1)
stack_base: .space 65536         # pilha (por último)

.text
  la   sp, stack_base
  la   tp, temp_base
  la   s4, ram
  mv   s2, s4                    # THIS = THAT = endereço 0 da VM
  mv   s3, s4
  mv   s0, sp                    # LCL = ARG = SP
  mv   s1, sp
vm_start:
  # se existir Sys.init: call Sys.init 0 (seção 7.4) e j vm_halt
  # código de todos os .vm
vm_halt:
  li   a0, 0
  li   a7, 10                    # ecall exit
  ecall
```

O `.data` e o bootstrap são montados **depois** de traduzir todos os arquivos, porque só então se sabe quais statics foram usados e se existe `Sys.init`.

- **Com `Sys.init`** (programas completos): o bootstrap chama `Sys.init`. Se o programa tem `Main.main` mas não tem `Sys.init`, o `Sys.init` do mini SO é incluído (seção 12). Ele normalmente termina num laço infinito; se retornar, o programa cai no `vm_halt`.
- **Sem `Sys.init`** (testes do cap. 7, `BasicLoop`, etc.): o código é executado de cima para baixo e termina no `vm_halt`.

O label `vm_start` marca o ponto onde o estado inicial já está pronto. Os testes inserem antes dele as instruções que preparam o cenário (o equivalente aos `set RAM[...]` dos `.tst` do Hack).

## 9. Diferenças semânticas em relação ao Hack

| Ponto | Hack | Este tradutor |
|---|---|---|
| Largura | 16 bits | 32 bits |
| Overflow | wrap em 16 bits | wrap em 32 bits |
| `lt`/`gt` com valores extremos | pode errar por overflow no `sub` | correto (usa `slt`) |
| Multiplicação/divisão | por software (Math.vm) | idem, a menos que se use a extensão M |
| Ponteiros | endereço de palavra | endereço de palavra na `ram` (convertido em `push/pop pointer`) |
| Tela/teclado | `SCREEN`=16384, `KBD`=24576 | a `ram` cobre esses endereços, mas são memória comum: **não estão ligados** ao MMIO do FPGRARS; exige adaptar o OS |
| `true` | −1 (16 bits: `0xFFFF`) | −1 (32 bits: `0xFFFFFFFF`) |

O OS do nand2tetris (`Math`, `Screen`, `Keyboard`, `Memory`) assume 16 bits e os endereços do Hack. Para usá-lo, reescreva ou adapte essas classes. Para programas sem OS, tudo funciona direto.

---

## 10. Organização do código

- `src/parser.rs`: lê e decompõe as linhas `.vm` (independente do assembly de saída).
- `src/code_writer.rs`: uma função por comando VM. `PUSH_T0`/`POP_T0`, `binary()`/`unary()` e `mem_access()` (que escolhe sozinho o caminho de offset grande) concentram as expansões repetidas. O mapeamento segmento → registrador fica em `segment_register()`.
- `src/translator.rs`: percorre os arquivos, junta o código, inclui o que faltar do mini SO e monta `.data` + bootstrap + código + `vm_halt`.
- `src/os.rs`: o mini SO (seção 12).

## 11. Testes

Os `.tst`/`.cmp` originais eram para o CPUEmulator do Hack e foram removidos. Cada pasta em `tests/vm1-*`, `tests/vm2-*` e `tests/os` tem os `.vm` originais e um `expected.txt` com o estado inicial (`setup:`) e os valores finais esperados (`reg` / `mem`), transcritos dos `.cmp`. O formato está descrito no topo de `tests/simulador.rs`.

```sh
RARS_JAR=/caminho/rars1_6.jar cargo test                            # confere valores no RARS
RARS_JAR=/caminho/rars1_6.jar FPGRARS=/caminho/fpgrars cargo test   # e também roda no FPGRARS
```

O RARS é usado para conferir os valores porque imprime registradores e memória ao final (e tem limite de passos, necessário para os testes cujo `Sys.init` termina em laço infinito). O FPGRARS é executado para garantir que o arquivo monta, roda sem erro e, nos programas sem `Sys.init`, termina (foi assim que o bug do `jr`, seção 2.9, apareceu).

`tests/os/MiniSO` testa as funções do mini SO que não dependem de vídeo/teclado (o RARS não tem o MMIO do FPGRARS).

## 12. Mini SO

Programas Jack chamam o SO do nand2tetris (`Math.multiply` para cada `*`, `Memory.alloc` em cada `new`, `Screen.*`...). O tradutor inclui automaticamente, a partir de `src/os.rs`, **só as funções que o programa chama e não define**, então classes do próprio programa (ex.: um `Math.vm` com `sin`/`cos`) continuam valendo, e só o que falta vem do mini SO. Se faltar uma função que o mini SO não tem, o tradutor para com `funções chamadas mas não definidas (nem no mini SO): ...`.

| Classe | Funções | Observações |
|---|---|---|
| `Sys` | `init`, `halt`, `error`, `wait` | `init` (em código VM) limpa a tela, chama `Main.main` e encerra. `wait` usa o ecall 32. `error` imprime `ERR<código>` e encerra. |
| `Memory` | `alloc`, `deAlloc`, `peek`, `poke` | Heap nas palavras 2048..16383 da `ram`, como no Hack. `alloc` só avança um ponteiro; **`deAlloc` não libera nada**. Basta para programas que alocam na inicialização. |
| `Array` | `new`, `dispose` | `new` = `Memory.alloc`. |
| `Math` | `multiply`, `divide`, `abs`, `min`, `max`, `sqrt` | Usam `mul`/`div` (extensão M, aceita pelo FPGRARS e pelo RARS). `divide` arredonda para zero; divisão por zero = `ERR3`. |
| `Screen` | `clearScreen`, `setColor`, `drawPixel`, `drawRectangle` | Desenham no frame 0 do FPGRARS (`0xFF000000`, 1 byte por pixel). Preto = `0x00`, branco = `0xFF`. Coordenadas fora da tela são recortadas. |
| `Keyboard` | `keyPressed` | Lê `KDMMIO_KEYDOWN`/`KDMMIO_DATADOWN` (`0xFF210000`/`0xFF210004`), que dizem qual caractere está pressionado **agora**, como no Hack. Enter, backspace, delete e esc viram 128, 129, 139 e 140 (códigos do Hack). As setas, que não geram caractere, vêm do `KEYMAP` (`0xFF200520`, um bit por scancode): ←↑→↓ = 130, 131, 132, 133. |

As funções em assembly seguem a convenção de `call`/`return` da VM: os argumentos estão em `0(s1)`, `4(s1)`..., o resultado vai em `t2`, e `j os_return` executa o `return`.

**Não implementado:** `Output`, `String`, `Screen.drawLine`/`drawCircle`, `Keyboard.readChar`/`readLine`/`readInt`.

**Setas:** os scancodes usados (← 105, ↑ 103, → 106, ↓ 108) são os do **Linux**: o FPGRARS repassa o scancode do winit, que no X11/Wayland é o keycode do X − 8. No Windows e no macOS os scancodes são outros, e as setas não vão funcionar sem ajustar `Keyboard.keyPressed` em `src/os.rs`. Outra limitação do FPGRARS: soltar *qualquer* tecla zera o `KDMMIO_KEYDOWN`. Então, se você segurar `w` e soltar uma seta, o `w` para de ser lido até ser pressionado de novo.

### Rodando um programa Jack

```sh
cargo run -- caminho/da/pasta/com/os/vm      # gera caminho/da/pasta/com/os/vm.s
fpgrars -w 512 -h 256 caminho/da/pasta/com/os/vm.s
```

O `-w 512 -h 256` é obrigatório: o mini SO desenha com a largura de 512 pixels do Hack. Para não precisar das flags, crie um `fpgrars.toml` no diretório de onde o FPGRARS é executado. Os campos booleanos são obrigatórios, senão ele falha com `missing field`:

```toml
no_video = false
print_instructions = false
print_state = false
width = 512
height = 256
scale = 2
```

