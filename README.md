<div align="center">

# N2T-RISCV

**Da VM do nand2tetris para RISC-V real**

Um tradutor de código VM do [nand2tetris](https://www.nand2tetris.org/) para assembly **RISC-V (RV32I)**, com um mini sistema operacional e um jogo estilo *Doom* escrito em Jack rodando no simulador [FPGRARS](https://github.com/LeoRiether/FPGRARS).

![Rust](https://img.shields.io/badge/Rust-2024-orange?logo=rust)
![RISC-V](https://img.shields.io/badge/ISA-RV32I-blue)
![Jack](https://img.shields.io/badge/linguagem-Jack-green)
![FPGRARS](https://img.shields.io/badge/alvo-FPGRARS%20%7C%20RARS-purple)

</div>

---

## Sobre o projeto

No curso **nand2tetris**, os programas escritos em Jack são compilados para uma linguagem de máquina virtual baseada em pilha (`.vm`), que depois é traduzida para o assembly do **Hack**, um computador de 16 bits que só existe dentro do curso.

Este projeto troca esse último passo: em vez de gerar assembly Hack, ele gera assembly **RISC-V de 32 bits**, uma arquitetura real. Assim, qualquer programa Jack (depois de compilado para `.vm`) pode rodar no RARS ou no FPGRARS, com **vídeo e teclado de verdade**.

```
 ┌──────────┐   compilador   ┌──────────┐   vm-translator   ┌──────────┐   FPGRARS   ┌────────────┐
 │  .jack   │ ─────────────> │   .vm    │ ────────────────> │    .s    │ ──────────> │   tela +   │
 │ (Jack)   │     Jack       │ (pilha)  │   (este projeto)  │ (RV32I)  │             │  teclado   │
 └──────────┘                └──────────┘                   └──────────┘             └────────────┘
```

## Estrutura

```
N2T-RISCV/
├── vm-translator/          # Tradutor VM → RISC-V, escrito em Rust
│   ├── src/
│   │   ├── main.rs         # CLI
│   │   ├── parser.rs       # lê e decompõe as linhas .vm
│   │   ├── code_writer.rs  # expansão de cada comando VM em RV32I
│   │   ├── translator.rs   # junta arquivos, monta .data + bootstrap
│   │   └── os.rs           # mini SO (Sys, Memory, Math, Screen, Keyboard...)
│   ├── tests/              # testes dos projetos 7 e 8 + mini SO
│   └── doc/help.md         # documentação completa das decisões de design
│
└── doom-like/              # Jogo raycaster 3D em Jack
    ├── src/                # código Jack (Game, Player, Raycaster, Renderer...)
    ├── src.s               # assembly RISC-V gerado pelo tradutor
    ├── maps/               # mapa em texto + script que gera o código Jack
    └── pre-process/        # gera a tabela de senos em ponto fixo
```

## vm-translator

Tradutor completo da linguagem VM do nand2tetris (projetos 7 e 8) para RV32I.

### Destaques

- Todos os comandos VM: aritmética, acesso à memória, `label`/`goto`/`if-goto`, `function`/`call`/`return`
- Ponteiros de segmento (`LCL`, `ARG`, `THIS`, `THAT`) ficam em **registradores**, então `push local i` vira um único `lw`
- Comparações (`eq`, `lt`, `gt`) **sem desvios**, usando `slt`/`sltiu`
- Traduz um único `.vm` ou uma pasta inteira em um só `.s`
- RAM da VM com 32K palavras, preservando a aritmética de ponteiros do Jack
- **Mini SO embutido**: só as funções que o programa chama e não define são incluídas

### Mapeamento de registradores

| Hack | Função | RISC-V |
|---|---|---|
| `SP` | topo da pilha | `sp` |
| `LCL` | base de `local` | `s0` |
| `ARG` | base de `argument` | `s1` |
| `THIS` | base de `this` / `pointer 0` | `s2` |
| `THAT` | base de `that` / `pointer 1` | `s3` |
| `temp` | `temp 0..7` | memória, base em `tp` |
| — | base da RAM da VM | `s4` |
| `D`, `A`, R13–R15 | rascunho | `t0`, `t1`, `t2` |

### Mini SO

| Classe | Funções |
|---|---|   
| `Sys` | `init`, `halt`, `error`, `wait` |
| `Memory` | `alloc`, `deAlloc`, `peek`, `poke` |
| `Array` | `new`, `dispose` |
| `Math` | `multiply`, `divide`, `abs`, `min`, `max`, `sqrt` |
| `Screen` | `clearScreen`, `setColor`, `drawPixel`, `drawRectangle` |
| `Keyboard` | `keyPressed` (incluindo as setas) |

> **Atenção:** Ainda não implementados: `Output`, `String`, `Screen.drawLine`/`drawCircle` e `Keyboard.readChar`/`readLine`/`readInt`.

### Uso

Requer [Rust](https://www.rust-lang.org/tools/install) instalado.

```sh
cd vm-translator

# um único arquivo → gera Arquivo.s ao lado dele
cargo run -- caminho/Arquivo.vm

# uma pasta inteira → gera Pasta.s ao lado da pasta
cargo run -- caminho/Pasta
```

Depois, rode o `.s` no FPGRARS (a largura 512×256 é obrigatória, pois é a tela do Hack):

```sh
fpgrars -w 512 -h 256 caminho/Pasta.s
```

<details>
<summary>Rodando sem precisar das flags</summary>

Crie um `fpgrars.toml` no diretório de onde o FPGRARS é executado:

```toml
no_video = false
print_instructions = false
print_state = false
width = 512
height = 256
scale = 2
```

</details>

### Testes

Os testes traduzem cada caso dos projetos 7 e 8 (e do mini SO), executam no **RARS** e conferem registradores e memória contra o `expected.txt` de cada pasta.

```sh
# confere os valores no RARS (requer Java)
RARS_JAR=/caminho/rars1_6.jar cargo test

# e também executa cada programa no FPGRARS
RARS_JAR=/caminho/rars1_6.jar FPGRARS=/caminho/fpgrars cargo test
```

Os detalhes de cada expansão, o layout do frame de `call`/`return`, as diferenças em relação ao Hack e as armadilhas dos simuladores estão em [`vm-translator/doc/help.md`](vm-translator/doc/help.md).

## doom-like

Um jogo de primeira pessoa no estilo **Wolfenstein 3D / Doom**, escrito em Jack e renderizado com **raycasting**, rodando no FPGRARS através do tradutor.

- Labirinto definido em [`maps/map.txt`](doom-like/maps/map.txt)
- Matemática em **ponto fixo** (escala 256) com tabela de senos pré-calculada
- 128 raios por quadro, desenhando teto, parede e chão coluna por coluna (sem piscar)

### Controles

| Tecla | Ação |
|:---:|---|
| <kbd>W</kbd> / <kbd>S</kbd> | andar para frente / para trás |
| <kbd>A</kbd> / <kbd>D</kbd> | andar para a esquerda / direita |
| <kbd>←</kbd> / <kbd>→</kbd> | girar a câmera |

### Como jogar

O assembly já gerado está no repositório:

```sh
fpgrars -w 512 -h 256 doom-like/src.s
```

Para regenerar depois de mudar o código Jack, compile `doom-like/src/` com o compilador Jack do nand2tetris e traduza a pasta de `.vm` resultante com o `vm-translator`.

### Editando o mapa

O mapa é uma grade de caracteres: `1` = parede, `0` = chão e `2` = posição inicial do jogador.

```sh
cd doom-like/maps
python3 map.py   # imprime o código Jack para colar em Map.jack
```

> **Atenção:** As setas usam os scancodes do **Linux**. No Windows e no macOS é preciso ajustar `Keyboard.keyPressed` em `vm-translator/src/os.rs`.

## Diferenças em relação ao Hack

| Ponto | Hack | Este projeto |
|---|---|---|
| Largura da palavra | 16 bits | 32 bits |
| Overflow | wrap em 16 bits | wrap em 32 bits |
| `lt` / `gt` com valores extremos | pode errar por overflow | correto (usa `slt`) |
| Tela e teclado | `SCREEN` = 16384, `KBD` = 24576 | MMIO do FPGRARS, via mini SO |
| Multiplicação / divisão | por software | `mul` / `div` (extensão M) no mini SO |

## Ferramentas

- [Rust](https://www.rust-lang.org/): implementação do tradutor
- [FPGRARS](https://github.com/LeoRiether/FPGRARS): simulador RISC-V rápido, com vídeo e teclado
- [RARS](https://github.com/TheThirdOne/rars): simulador RISC-V usado nos testes
- [nand2tetris](https://www.nand2tetris.org/): curso e ferramentas originais (compilador Jack)
