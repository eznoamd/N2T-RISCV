//! Mini SO: implementações das funções do SO do nand2tetris
//! (Sys, Memory, Array, Math, Screen, Keyboard) para o FPGRARS.
//!
//! O tradutor só inclui as funções que o programa chama e não define,
//! então um programa que traz o próprio Math.vm (por exemplo) continua
//! usando o seu, e só as que faltam vêm daqui.
//!
//! As funções em assembly seguem a mesma convenção do call/return da VM:
//! os argumentos estão em 0(s1), 4(s1), ...; o resultado vai em t2
//! e "j os_return" faz o return da VM. Funções void retornam 0.
//! Elas podem usar t0-t6 e a0-a7 à vontade (nenhum valor da VM vive neles).

/// Corpo de uma função do mini SO
pub enum Body {
    /// código VM, traduzido como qualquer outro .vm
    Vm(&'static str),
    /// assembly RISC-V pronto
    Asm(&'static str),
}

pub struct OsFunction {
    pub name: &'static str,
    pub body: Body,
    /// funções chamadas pelo assembly (as chamadas do código VM são detectadas sozinhas)
    pub deps: &'static [&'static str],
}

// Vídeo: frame 0 do FPGRARS em 0xFF000000, 1 byte por pixel (BBGGGRRR),
// com o tamanho da tela do Hack (512x256). Rode com:
//     fpgrars -w 512 -h 256 programa.s
//
// Teclado: KDMMIO_KEYDOWN (0xFF210000) = 1 enquanto alguma tecla está
// pressionada, e KDMMIO_DATADOWN (0xFF210004) = o caractere dela.
// KEYMAP (0xFF200520): mapa de bits por scancode, usado para as setas.

/// Dados usados pelo mini SO, emitidos no .data quando alguma função em assembly é usada
pub const DATA: &[&str] = &[
    "os_heap: .word 2048", // próxima palavra livre do heap (heap do Hack: 2048..16383)
    "os_color: .word 0",   // cor atual: 0x00 = preto (true), 0xFF = branco (false)
];

/// Rotinas compartilhadas pelas funções em assembly
pub const COMMON: &str = "\
# return da VM com o valor de retorno em t2
# (jalr explícito: o FPGRARS monta jr t1 errado, ver write_return)
os_return:
mv   t0, s0
lw   t1, -20(t0)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

# Sys.error: imprime ERR<código em a0> e encerra
os_fail:
mv   t3, a0
li   a7, 11
li   a0, 69
ecall
li   a0, 82
ecall
li   a0, 82
ecall
mv   a0, t3
li   a7, 1
ecall
li   a0, 10
li   a7, 11
ecall
li   a0, 1
li   a7, 10
ecall
";

pub const FUNCTIONS: &[OsFunction] = &[
    // ---------------------------------------------------- Sys
    OsFunction {
        name: "Sys.init",
        body: Body::Vm("
            function Sys.init 0
            call Screen.clearScreen 0
            pop temp 0
            call Main.main 0
            pop temp 0
            call Sys.halt 0
            label HALT
            goto HALT
        "),
        deps: &[],
    },
    OsFunction {
        name: "Sys.halt",
        body: Body::Asm("\
Sys.halt:
li   a0, 0
li   a7, 10
ecall
"),
        deps: &[],
    },
    OsFunction {
        name: "Sys.error",
        body: Body::Asm("\
Sys.error:
lw   a0, 0(s1)
j    os_fail
"),
        deps: &[],
    },
    OsFunction {
        // Sys.wait(ms): ecall 32 (sleep)
        name: "Sys.wait",
        body: Body::Asm("\
Sys.wait:
lw   a0, 0(s1)
blez a0, os__wait_end
li   a7, 32
ecall
os__wait_end:
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    // ---------------------------------------------------- Memory / Array
    OsFunction {
        // Memory.alloc(size): só avança o ponteiro do heap (deAlloc não libera)
        // e devolve o endereço de palavra do bloco
        name: "Memory.alloc",
        body: Body::Asm("\
Memory.alloc:
lw   t3, 0(s1)
li   a0, 5
blez t3, os_fail
la   t4, os_heap
lw   t2, 0(t4)
add  t5, t2, t3
li   t6, 16384
li   a0, 6
bgt  t5, t6, os_fail
sw   t5, 0(t4)
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        name: "Memory.deAlloc",
        body: Body::Asm("\
Memory.deAlloc:
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // Memory.peek(addr) = RAM[addr]
        name: "Memory.peek",
        body: Body::Asm("\
Memory.peek:
lw   t3, 0(s1)
slli t3, t3, 2
add  t3, t3, s4
lw   t2, 0(t3)
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // Memory.poke(addr, value): RAM[addr] = value
        name: "Memory.poke",
        body: Body::Asm("\
Memory.poke:
lw   t3, 0(s1)
lw   t4, 4(s1)
slli t3, t3, 2
add  t3, t3, s4
sw   t4, 0(t3)
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // mesmo argumento e retorno do Memory.alloc
        name: "Array.new",
        body: Body::Asm("\
Array.new:
j    Memory.alloc
"),
        deps: &["Memory.alloc"],
    },
    OsFunction {
        // método: o argumento 0 é o próprio array
        name: "Array.dispose",
        body: Body::Asm("\
Array.dispose:
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    // ---------------------------------------------------- Math
    OsFunction {
        name: "Math.multiply",
        body: Body::Asm("\
Math.multiply:
lw   t3, 0(s1)
lw   t4, 4(s1)
mul  t2, t3, t4
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // arredonda para zero, como o SO do Hack; divisão por zero = ERR3
        name: "Math.divide",
        body: Body::Asm("\
Math.divide:
lw   t3, 0(s1)
lw   t4, 4(s1)
li   a0, 3
beqz t4, os_fail
div  t2, t3, t4
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        name: "Math.abs",
        body: Body::Asm("\
Math.abs:
lw   t3, 0(s1)
srai t4, t3, 31
xor  t2, t3, t4
sub  t2, t2, t4
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        name: "Math.min",
        body: Body::Asm("\
Math.min:
lw   t2, 0(s1)
lw   t3, 4(s1)
ble  t2, t3, os__min_end
mv   t2, t3
os__min_end:
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        name: "Math.max",
        body: Body::Asm("\
Math.max:
lw   t2, 0(s1)
lw   t3, 4(s1)
bge  t2, t3, os__max_end
mv   t2, t3
os__max_end:
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // raiz inteira, bit a bit; negativo = ERR4
        name: "Math.sqrt",
        body: Body::Asm("\
Math.sqrt:
lw   t3, 0(s1)
li   a0, 4
bltz t3, os_fail
li   t2, 0
li   t4, 32768
os__sqrt_loop:
beqz t4, os__sqrt_end
add  t5, t2, t4
mul  t6, t5, t5
bgtu t6, t3, os__sqrt_next
mv   t2, t5
os__sqrt_next:
srli t4, t4, 1
j    os__sqrt_loop
os__sqrt_end:
j    os_return
"),
        deps: &[],
    },
    // ---------------------------------------------------- Screen (512x256)
    OsFunction {
        // pinta o frame 0 inteiro de branco
        name: "Screen.clearScreen",
        body: Body::Asm("\
Screen.clearScreen:
li   t3, 0xFF000000
li   t4, 131072
add  t4, t4, t3
li   t5, -1
os__clear_loop:
sw   t5, 0(t3)
addi t3, t3, 4
bltu t3, t4, os__clear_loop
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // Screen.setColor(b): true = preto, false = branco
        name: "Screen.setColor",
        body: Body::Asm("\
Screen.setColor:
lw   t3, 0(s1)
snez t3, t3
addi t3, t3, -1
andi t3, t3, 255
la   t4, os_color
sw   t3, 0(t4)
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // Screen.drawPixel(x, y): fora da tela é ignorado
        name: "Screen.drawPixel",
        body: Body::Asm("\
Screen.drawPixel:
lw   t3, 0(s1)
lw   t4, 4(s1)
li   t5, 512
bgeu t3, t5, os__pixel_end
li   t5, 256
bgeu t4, t5, os__pixel_end
slli t4, t4, 9
add  t4, t4, t3
li   t5, 0xFF000000
add  t4, t4, t5
la   t5, os_color
lw   t5, 0(t5)
sb   t5, 0(t4)
os__pixel_end:
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    OsFunction {
        // Screen.drawRectangle(x1, y1, x2, y2), inclusivo, recortado à tela
        name: "Screen.drawRectangle",
        body: Body::Asm("\
Screen.drawRectangle:
lw   t3, 0(s1)
lw   t4, 4(s1)
lw   t5, 8(s1)
lw   t6, 12(s1)
bgez t3, os__rect_x1
li   t3, 0
os__rect_x1:
bgez t4, os__rect_y1
li   t4, 0
os__rect_y1:
li   a0, 511
ble  t5, a0, os__rect_x2
mv   t5, a0
os__rect_x2:
li   a0, 255
ble  t6, a0, os__rect_y2
mv   t6, a0
os__rect_y2:
bgt  t3, t5, os__rect_end
bgt  t4, t6, os__rect_end
la   a0, os_color
lw   a0, 0(a0)
li   a1, 0xFF000000
slli a2, t4, 9
add  a2, a2, a1
os__rect_row:
add  a3, a2, t3
add  a4, a2, t5
os__rect_col:
sb   a0, 0(a3)
addi a3, a3, 1
bleu a3, a4, os__rect_col
addi a2, a2, 512
addi t4, t4, 1
ble  t4, t6, os__rect_row
os__rect_end:
li   t2, 0
j    os_return
"),
        deps: &[],
    },
    // ---------------------------------------------------- Keyboard
    OsFunction {
        // tecla pressionada agora (0 se nenhuma), via KDMMIO_KEYDOWN do FPGRARS.
        // Converte enter/backspace/delete/esc para os códigos do Hack.
        //
        // As setas não geram caractere, então não aparecem no KDMMIO_KEYDOWN:
        // sem caractere pressionado, consulta o KEYMAP (bit k = scancode k
        // pressionado). Os scancodes são os do Linux (keycode do X - 8):
        // ← 105, ↑ 103, → 106, ↓ 108  ->  Hack 130, 131, 132, 133
        name: "Keyboard.keyPressed",
        body: Body::Asm("\
Keyboard.keyPressed:
li   t3, 0xFF210000
lbu  t4, 0(t3)
beqz t4, os__key_arrows
lbu  t2, 4(t3)
li   t5, 10
li   t6, 128
beq  t2, t5, os__key_map
li   t5, 8
li   t6, 129
beq  t2, t5, os__key_map
li   t5, 127
li   t6, 139
beq  t2, t5, os__key_map
li   t5, 27
li   t6, 140
beq  t2, t5, os__key_map
j    os__key_end
os__key_map:
mv   t2, t6
j    os__key_end
os__key_arrows:
li   t3, 0xFF200520
lbu  t4, 12(t3)
andi t5, t4, 128
li   t2, 131
bnez t5, os__key_end
lbu  t4, 13(t3)
andi t5, t4, 2
li   t2, 130
bnez t5, os__key_end
andi t5, t4, 4
li   t2, 132
bnez t5, os__key_end
andi t5, t4, 16
li   t2, 133
bnez t5, os__key_end
li   t2, 0
os__key_end:
j    os_return
"),
        deps: &[],
    },
];

/// Procura uma função do mini SO pelo nome
pub fn find(name: &str) -> Option<&'static OsFunction> {
    FUNCTIONS.iter().find(|f| f.name == name)
}
