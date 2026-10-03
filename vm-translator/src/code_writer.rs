use std::collections::BTreeSet;

use crate::parser::CommandType;

/// Maior offset positivo que cabe no imediato de 12 bits de lw/sw/addi
const MAX_IMM: i32 = 2047;

/// Tamanho da RAM da VM em palavras (endereços Hack 0..32767)
const RAM_WORDS: i32 = 32768;

/// Tamanho da pilha em palavras
const STACK_WORDS: i32 = 16384;

/// Responsável por traduzir comandos VM para assembly RISC-V (RV32I)
///
/// Registradores reservados (ver doc/help.md):
///   sp = SP, s0 = LCL, s1 = ARG, s2 = THIS, s3 = THAT,
///   tp = base do temp, s4 = base da RAM da VM
///   t0, t1, t2 = rascunho
pub struct CodeWriter {
    file_name: String,  // nome do arquivo .vm (usado nos símbolos static)
    label_count: u32,   // contador usado para gerar rótulos internos únicos (if-goto)
    current_function: String, // função vm atualmente sendo traduzida, usado para criar labels com escopo
                              // Exemplo: Foo.bar$LOOP
    call_count: u32, // contador usado para gerar endereços de retorno unicos
    statics: BTreeSet<String>, // símbolos static usados, emitidos no .data no final
    has_sys_init: bool, // se alguma função Sys.init foi traduzida (decide o bootstrap)
    defined: BTreeSet<String>, // funções definidas (function ou mini SO)
    called: BTreeSet<String>,  // funções chamadas (call)
    extra_data: Vec<String>,   // linhas extras do .data (dados do mini SO)
}

impl CodeWriter {
    pub fn new(file_name: String) -> Self {
        Self {
            file_name: sanitize(&file_name),
            label_count: 0,
            current_function: String::new(),
            call_count: 0,
            statics: BTreeSet::new(),
            has_sys_init: false,
            defined: BTreeSet::new(),
            called: BTreeSet::new(),
            extra_data: Vec::new(),
        }
    }

    /// Atualiza o nome do arquivo atualmente sendo traduzido.
    pub fn set_file_name(&mut self, file_name: String) {
        self.file_name = sanitize(&file_name);
        // labels fora de função ficam com o escopo do arquivo
        self.current_function = String::new();
    }

    // ========================================================
    // PROJETO 7
    // ========================================================

    /// Traduz um comando aritmético/lógico para Assembly
    pub fn write_arithmetic(&mut self, command: &str) -> String {
        match command {
            // Comandos binários: x = segundo elemento, y = topo.
            // O resultado fica no lugar de x
            "add" => binary("add  t0, t0, t1\n"), // x + y
            "sub" => binary("sub  t0, t0, t1\n"), // x - y
            "and" => binary("and  t0, t0, t1\n"), // x & y
            "or" => binary("or   t0, t0, t1\n"),  // x | y

            // Comparações sem branch: slt/sltiu dão 1 ou 0,
            // e "sub t0, x0, t0" transforma 1 em -1 (true)
            "eq" => binary("sub  t0, t0, t1\nsltiu t0, t0, 1\nsub  t0, x0, t0\n"), // x == y
            "lt" => binary("slt  t0, t0, t1\nsub  t0, x0, t0\n"), // x < y
            "gt" => binary("slt  t0, t1, t0\nsub  t0, x0, t0\n"), // x > y

            // Comandos unários: operam diretamente sobre o topo da pilha
            "neg" => unary("sub  t0, x0, t0\n"), // -y
            "not" => unary("xori t0, t0, -1\n"), // !y

            // para qualquer outro gera um erro de execução
            _ => panic!("Comando aritmético inválido: {}", command),
        }
    }

    /// Traduz um comando push ou pop para Assembly
    pub fn write_push_pop(&mut self, command_type: &CommandType, segment: &str, index: i32,) -> String {
        if index < 0 {
            panic!("Índice negativo em push/pop: {}", index);
        }

        match command_type {
            CommandType::Push => self.write_push(segment, index),
            CommandType::Pop => self.write_pop(segment, index),
            _ => panic!("write_push_pop recebeu um comando inválido"),
        }
    }

    /// Traduz um comando push, empilhando o valor do segmento/índice indicado
    fn write_push(&mut self, segment: &str, index: i32) -> String {
        match segment {
            // otimização: zero vem direto de x0, sem precisar do li
            "constant" if index == 0 => "sw   x0, 0(sp)\naddi sp, sp, 4\n".to_string(),
            "constant" => format!("li   t0, {}\n{}", index, PUSH_T0),

            // t0 = *(base do segmento + 4*índice)
            "local" | "argument" | "this" | "that" | "temp" => {
                Self::check_temp(segment, index);
                format!("{}{}", mem_access("lw", Self::segment_register(segment), index), PUSH_T0)
            }

            // pointer 0/1 empilha THIS/THAT como endereço de palavra da VM:
            // (s2 - s4) / 4
            "pointer" => format!(
                "sub  t0, {}, s4\nsrai t0, t0, 2\n{}",
                Self::pointer_register(index),
                PUSH_T0,
            ),

            // variável estática Foo.i
            "static" => format!("la   t1, {}\nlw   t0, 0(t1)\n{}", self.static_symbol(index), PUSH_T0),

            // retorna erro de execução se o segmento for inválido
            _ => panic!("Segmento inválido: {}", segment),
        }
    }

    /// Traduz um comando pop, retirando o topo da pilha e guardando no índice indicado
    fn write_pop(&mut self, segment: &str, index: i32) -> String {
        match segment {
            // *(base do segmento + 4*índice) = t0
            "local" | "argument" | "this" | "that" | "temp" => {
                Self::check_temp(segment, index);
                format!("{}{}", POP_T0, mem_access("sw", Self::segment_register(segment), index))
            }

            // pointer 0/1 recebe um endereço de palavra da VM e
            // guarda o endereço real em bytes: s4 + 4*valor
            "pointer" => format!(
                "{}slli t0, t0, 2\nadd  {}, s4, t0\n",
                POP_T0,
                Self::pointer_register(index),
            ),

            "static" => format!("{}la   t1, {}\nsw   t0, 0(t1)\n", POP_T0, self.static_symbol(index)),

            "constant" => panic!("Não é possível dar pop em constant"),
            _ => panic!("Segmento inválido: {}", segment),
        }
    }

    // ========================================================
    // PROJETO 8
    // ========================================================

    /// Traduz: label LOOP
    /// para: FuncaoAtual$LOOP:
    pub fn write_label(&self, label: &str) -> String {
        return format!("{}:\n", self.scoped_label(label));
    }

    /// Traduz: goto LOOP
    /// para: j FuncaoAtual$LOOP
    pub fn write_goto(&self, label: &str) -> String {
        return format!("j    {}\n", self.scoped_label(label));
    }

    /// Traduz: if-goto LOOP
    ///
    /// Usa beqz + j em vez de um único bnez: o bnez só alcança ±4 KiB,
    /// o que uma função grande ultrapassa fácil. O j alcança ±1 MiB.
    pub fn write_if(&mut self, label: &str) -> String {
        let skip_label = format!("{}__skip_{}", self.scope(), self.label_count);
        self.label_count += 1;

        return format!(
            "{}beqz t0, {skip}\nj    {target}\n{skip}:\n",
            POP_T0,
            skip = skip_label,
            target = self.scoped_label(label),
        )
    }

    /// Adiciona o escopo da função ao label.
    /// Exemplo: function Main.main 0
    ///          label LOOP
    ///
    /// vira:    Main.main$LOOP:
    ///
    /// Fora de uma função o escopo é o nome do arquivo.
    fn scoped_label(&self, label: &str) -> String {
        return format!("{}${}", self.scope(), sanitize(label))
    }

    /// Escopo usado nos labels: a função atual ou, fora de uma função, o arquivo
    fn scope(&self) -> &str {
        if self.current_function.is_empty() {
            &self.file_name
        } else {
            &self.current_function
        }
    }

    /// Traduz: function Foo.bar 2
    ///
    /// para: Foo.bar:
    ///       sw   x0, 0(sp)
    ///       sw   x0, 4(sp)
    ///       addi sp, sp, 8
    pub fn write_function(&mut self, name: &str, n_vars: i32) -> String {
        if n_vars < 0 {
            panic!("Número de variáveis negativo em {}", name);
        }

        self.mark_defined(name);

        self.current_function = sanitize(name);

        let mut output = format!("{}:\n", self.current_function);

        // Cada variável local começa com 0.
        if 4 * n_vars <= MAX_IMM {
            // desenrolado: um sw por local e o sp ajustado uma vez só
            for i in 0..n_vars {
                output.push_str(&format!("sw   x0, {}(sp)\n", 4 * i));
            }
            if n_vars > 0 {
                output.push_str(&format!("addi sp, sp, {}\n", 4 * n_vars));
            }
        } else {
            // muitas locais: laço em vez de desenrolar
            output.push_str(&format!(
                "li   t0, {n}\n\
                 {f}__init_loop:\n\
                 beqz t0, {f}__init_end\n\
                 sw   x0, 0(sp)\n\
                 addi sp, sp, 4\n\
                 addi t0, t0, -1\n\
                 j    {f}__init_loop\n\
                 {f}__init_end:\n",
                n = n_vars,
                f = self.current_function,
            ));
        }

        return output
    }

    /// Traduz: call Foo.bar 2
    ///
    /// para:
    ///
    /// [1] endereço de retorno
    /// [2] LCL
    /// [3] ARG
    /// [4] THIS
    /// [5] THAT
    /// [6] ARG = SP - 5 - nArgs
    /// [7] LCL = SP
    /// [8] goto Foo.bar
    pub fn write_call(&mut self, function_name: &str, n_args: i32) -> String {
        if n_args < 0 {
            panic!("Número de argumentos negativo ao chamar {}", function_name);
        }

        self.mark_called(function_name);

        let return_label = format!("{}__ret_{}", self.scope(), self.call_count);
        self.call_count += 1;

        // salva o frame do chamador e avança o sp uma vez só
        let mut output = format!(
            "la   t0, {}\n\
             sw   t0, 0(sp)\n\
             sw   s0, 4(sp)\n\
             sw   s1, 8(sp)\n\
             sw   s2, 12(sp)\n\
             sw   s3, 16(sp)\n\
             addi sp, sp, 20\n",
            return_label
        );

        // ARG = SP - 5 - nArgs (em bytes: sp - 20 - 4*nArgs)
        let arg_offset = 20 + 4 * n_args;
        if arg_offset <= MAX_IMM {
            output.push_str(&format!("addi s1, sp, -{}\n", arg_offset));
        } else {
            output.push_str(&format!("li   t1, {}\nsub  s1, sp, t1\n", arg_offset));
        }

        // LCL = SP e goto function
        output.push_str(&format!(
            "mv   s0, sp\n\
             j    {}\n\
             {}:\n",
            sanitize(function_name),
            return_label,
        ));

        return output
    }

    /// Traduz o comando return.
    ///
    /// t0 = LCL            |(FRAME)
    /// t1 = *(FRAME - 5)   |(RET), lido antes de sobrescrever *ARG
    ///
    /// *ARG = pop()
    /// SP = ARG + 1
    /// THAT = *(FRAME - 1)
    /// THIS = *(FRAME - 2)
    /// ARG  = *(FRAME - 3)
    /// LCL  = *(FRAME - 4)
    /// goto RET
    ///
    /// O salto usa "jalr x0, t1, 0" e não "jr t1": o FPGRARS (v2.3) monta
    /// "jr t1" como "jalr t1, x0, 0", que salta para o endereço 0.
    pub fn write_return(&self) -> String {
        return "\
mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0
"
        .to_string()
    }

    /// Código inicial do programa (início do .text):
    ///
    /// inicializa sp, tp, s4 e os ponteiros de segmento
    /// e, se existir Sys.init, chama Sys.init 0 e encerra.
    /// Sem Sys.init, o código dos .vm é executado de cima para baixo
    /// até cair no vm_halt (usado nos testes do projeto 7).
    ///
    /// Deve ser chamado depois de traduzir todos os arquivos,
    /// pois só então se sabe se Sys.init existe.
    pub fn write_init(&mut self) -> String {
        let mut output = String::from("\
.text
la   sp, stack_base
la   tp, temp_base
la   s4, ram
mv   s2, s4
mv   s3, s4
mv   s0, sp
mv   s1, sp
vm_start:
");

        if self.has_sys_init {
            self.current_function = "Bootstrap".to_string();
            output.push_str(&self.write_call("Sys.init", 0));
            output.push_str("j    vm_halt\n");
        }

        return output
    }

    /// Encerramento do programa (fim do .text)
    pub fn write_halt(&self) -> String {
        return "\
vm_halt:
li   a0, 0
li   a7, 10
ecall
"
        .to_string()
    }

    /// Seção .data: temp, statics usados, RAM da VM e a pilha (por último)
    pub fn write_data(&self) -> String {
        let mut output = String::from(".data\ntemp_base: .space 32\n");

        for symbol in &self.statics {
            output.push_str(&format!("{}: .word 0\n", symbol));
        }

        for line in &self.extra_data {
            output.push_str(line);
            output.push('\n');
        }

        output.push_str(&format!("ram: .space {}\n", 4 * RAM_WORDS));
        output.push_str(&format!("stack_base: .space {}\n", 4 * STACK_WORDS));

        return output
    }

    /// Registra uma função como definida (pelo código VM ou pelo mini SO)
    pub fn mark_defined(&mut self, name: &str) {
        if name == "Sys.init" {
            self.has_sys_init = true;
        }
        self.defined.insert(name.to_string());
    }

    /// Registra uma função como chamada
    pub fn mark_called(&mut self, name: &str) {
        self.called.insert(name.to_string());
    }

    pub fn is_defined(&self, name: &str) -> bool {
        self.defined.contains(name)
    }

    /// Funções chamadas que ainda não foram definidas
    pub fn missing_functions(&self) -> Vec<String> {
        self.called.difference(&self.defined).cloned().collect()
    }

    /// Adiciona uma linha ao .data (antes da RAM e da pilha)
    pub fn add_data(&mut self, line: &str) {
        self.extra_data.push(line.to_string());
    }

    // FUNÇÕES AUXILIARES

    /// Retorna o símbolo de static i do arquivo atual e o registra para o .data
    fn static_symbol(&mut self, index: i32) -> String {
        let symbol = format!("{}.{}", self.file_name, index);
        self.statics.insert(symbol.clone());
        return symbol
    }

    /// Retorna o registrador base de cada segmento
    fn segment_register(segment: &str) -> &'static str {
        match segment {
            "local" => "s0",
            "argument" => "s1",
            "this" => "s2",
            "that" => "s3",
            "temp" => "tp",
            _ => unreachable!(), // não deveria ser chamado com outro segmento, pois isso é filtrado antes
        }
    }

    /// Retorna o registrador apontado por "pointer" (0 = THIS, 1 = THAT)
    fn pointer_register(index: i32) -> &'static str {
        match index {
            0 => "s2",
            1 => "s3",
            _ => panic!("Índice inválido para pointer: {}", index),
        }
    }

    /// temp só tem 8 posições (temp 0..7)
    fn check_temp(segment: &str, index: i32) {
        if segment == "temp" && index > 7 {
            panic!("Índice inválido para temp: {}", index);
        }
    }
}

/// Empilha t0
const PUSH_T0: &str = "sw   t0, 0(sp)\naddi sp, sp, 4\n";

/// Desempilha para t0
const POP_T0: &str = "addi sp, sp, -4\nlw   t0, 0(sp)\n";

/// Operação binária: t0 = x, t1 = y, resultado em t0 no lugar de x
fn binary(op: &str) -> String {
    return format!("lw   t1, -4(sp)\nlw   t0, -8(sp)\n{}sw   t0, -8(sp)\naddi sp, sp, -4\n", op)
}

/// Operação unária sobre o topo da pilha, sem mexer no sp
fn unary(op: &str) -> String {
    return format!("lw   t0, -4(sp)\n{}sw   t0, -4(sp)\n", op)
}

/// Gera "lw/sw t0, 4*i(base)", ou o cálculo do endereço em t1
/// quando 4*i não cabe no imediato de 12 bits
fn mem_access(op: &str, base: &str, index: i32) -> String {
    let offset = 4 * index;

    if offset <= MAX_IMM {
        format!("{op}   t0, {offset}({base})\n")
    } else {
        format!("li   t1, {offset}\nadd  t1, t1, {base}\n{op}   t0, 0(t1)\n")
    }
}

/// Troca caracteres que o assembler não aceita em labels (ex.: ':') por '_'
fn sanitize(name: &str) -> String {
    name.chars()
        .map(|c| if c.is_ascii_alphanumeric() || matches!(c, '_' | '.' | '$') { c } else { '_' })
        .collect()
}
