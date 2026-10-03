//! Testes de integração: traduz cada pasta de teste, executa o .s no RARS
//! e confere registradores e memória contra o expected.txt da pasta.
//!
//! Requer Java e o RARS (https://github.com/TheThirdOne/rars/releases):
//!
//!     RARS_JAR=/caminho/rars1_6.jar cargo test
//!
//! Opcional: FPGRARS=/caminho/fpgrars também executa cada .s no FPGRARS.
//! Ele não exporta a memória, então só confere que monta, roda sem erro e,
//! nos programas sem Sys.init, que termina (os com Sys.init ficam em laço).
//!
//! Formato do expected.txt (linhas com # são comentários):
//!
//!     setup: <instrução>      inserida antes de vm_start (prepara o estado inicial)
//!     steps: <n>              limite de passos no RARS (padrão 100000)
//!     reg <reg> = <valor>     valor final de um registrador
//!     mem <endereço> = <v>... palavras consecutivas a partir do endereço
//!
//! <valor> e <endereço> são um número ou simbolo[i] (endereço do símbolo + 4*i),
//! com os símbolos do .data gerado (temp_base, ram, stack_base, Arq.i).

use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, Stdio};
use std::thread;
use std::time::{Duration, Instant};

/// Endereço inicial do .data na configuração padrão do RARS
const DATA_BASE: i64 = 0x1001_0000;

#[test]
fn testes_no_simulador() {
    let rars_jar = std::env::var("RARS_JAR").expect(
        "defina RARS_JAR com o caminho do rars1_6.jar (ex.: RARS_JAR=~/rars1_6.jar cargo test)",
    );

    let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests");
    let mut test_dirs: Vec<PathBuf> = Vec::new();
    for group in ["vm1-stack-and-memory", "vm2-branching-and-functions", "os"] {
        for entry in fs::read_dir(root.join(group)).unwrap() {
            let path = entry.unwrap().path();
            if path.join("expected.txt").exists() {
                test_dirs.push(path);
            }
        }
    }
    test_dirs.sort();
    assert!(!test_dirs.is_empty(), "nenhum teste encontrado");

    let mut failures = Vec::new();
    for dir in &test_dirs {
        let name = dir.file_name().unwrap().to_string_lossy().to_string();
        match run_test(dir, &rars_jar) {
            Ok(()) => println!("ok    {}", name),
            Err(error) => {
                println!("FALHA {}\n{}", name, error);
                failures.push(name);
            }
        }
    }

    assert!(failures.is_empty(), "testes com falha: {:?}", failures);
}

/// Uma verificação do expected.txt
enum Check {
    Reg(String, String),
    Mem(String, Vec<i64>),
}

fn run_test(dir: &Path, rars_jar: &str) -> Result<(), String> {
    let name = dir.file_name().unwrap().to_string_lossy().to_string();

    // traduz uma cópia da pasta, para não deixar .s dentro de tests/
    let work = Path::new(env!("CARGO_TARGET_TMPDIR")).join(&name);
    let _ = fs::remove_dir_all(&work);
    fs::create_dir_all(&work).unwrap();
    for entry in fs::read_dir(dir).unwrap() {
        let path = entry.unwrap().path();
        if path.extension().and_then(|e| e.to_str()) == Some("vm") {
            fs::copy(&path, work.join(path.file_name().unwrap())).unwrap();
        }
    }

    let status = Command::new(env!("CARGO_BIN_EXE_translator"))
        .arg(&work)
        .stdout(Stdio::null())
        .status()
        .unwrap();
    if !status.success() {
        return Err("  o tradutor falhou".to_string());
    }
    let asm_path = work.with_extension("s");
    let asm = fs::read_to_string(&asm_path).unwrap();

    // lê o expected.txt
    let mut setup = String::new();
    let mut steps = 100_000;
    let mut checks = Vec::new();
    for line in fs::read_to_string(dir.join("expected.txt")).unwrap().lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        if let Some(instr) = line.strip_prefix("setup:") {
            setup.push_str(instr.trim());
            setup.push('\n');
        } else if let Some(n) = line.strip_prefix("steps:") {
            steps = n.trim().parse().unwrap();
        } else {
            let (lhs, rhs) = line.split_once('=').expect("linha inválida no expected.txt");
            let mut lhs = lhs.split_whitespace();
            let kind = lhs.next().unwrap();
            let target = lhs.next().unwrap().to_string();
            match kind {
                "reg" => checks.push(Check::Reg(target, rhs.trim().to_string())),
                "mem" => checks.push(Check::Mem(
                    target,
                    rhs.split_whitespace().map(|v| v.parse().unwrap()).collect(),
                )),
                _ => panic!("verificação desconhecida: {}", kind),
            }
        }
    }

    // insere o setup antes de vm_start
    assert!(asm.contains("\nvm_start:\n"), "vm_start não encontrado no .s");
    let asm = asm.replacen("\nvm_start:\n", &format!("\n{}vm_start:\n", setup), 1);
    fs::write(&asm_path, &asm).unwrap();

    let symbols = data_symbols(&asm);

    // monta os argumentos do RARS: registradores e faixas de memória a exibir
    let mut args: Vec<String> = ["-jar", rars_jar, "nc", "dec", "se3", "ae4"]
        .iter()
        .map(|s| s.to_string())
        .collect();
    args.push(steps.to_string());
    for check in &checks {
        match check {
            Check::Reg(reg, _) => args.push(reg.clone()),
            Check::Mem(addr, values) => {
                let start = eval(addr, &symbols)?;
                let end = start + 4 * (values.len() as i64 - 1);
                args.push(format!("0x{:x}-0x{:x}", start, end));
            }
        }
    }
    args.push(asm_path.to_string_lossy().to_string());

    let output = Command::new("java").args(&args).output().unwrap();
    let stdout = String::from_utf8_lossy(&output.stdout).to_string();
    let stderr = String::from_utf8_lossy(&output.stderr).to_string();
    if stdout.contains("Error") || stderr.contains("Error") || matches!(output.status.code(), Some(3 | 4)) {
        return Err(format!("  erro no RARS:\n{}{}", stdout, stderr));
    }

    // lê a saída do RARS: "reg\tvalor" e "Mem[0xendereço]\tv0\tv1..."
    let mut registers: HashMap<String, i64> = HashMap::new();
    let mut memory: HashMap<i64, i64> = HashMap::new();
    for line in stdout.lines() {
        let fields: Vec<&str> = line.split('\t').filter(|f| !f.is_empty()).collect();
        if fields.len() < 2 {
            continue;
        }
        if let Some(addr) = fields[0].strip_prefix("Mem[0x").and_then(|a| a.strip_suffix(']')) {
            let addr = i64::from_str_radix(addr, 16).unwrap();
            for (i, value) in fields[1..].iter().enumerate() {
                memory.insert(addr + 4 * i as i64, value.parse().unwrap());
            }
        } else if let Ok(value) = fields[1].parse() {
            registers.insert(fields[0].to_string(), value);
        }
    }

    // confere
    let mut errors = String::new();
    for check in &checks {
        match check {
            Check::Reg(reg, expected) => {
                let expected = eval(expected, &symbols)?;
                match registers.get(reg) {
                    Some(&got) if got == expected => {}
                    got => errors.push_str(&format!("  {}: esperado {}, obtido {:?}\n", reg, expected, got)),
                }
            }
            Check::Mem(addr, values) => {
                let start = eval(addr, &symbols)?;
                for (i, &expected) in values.iter().enumerate() {
                    match memory.get(&(start + 4 * i as i64)) {
                        Some(&got) if got == expected => {}
                        got => errors.push_str(&format!(
                            "  {}+{}: esperado {}, obtido {:?}\n",
                            addr, i, expected, got
                        )),
                    }
                }
            }
        }
    }

    if let Ok(fpgrars) = std::env::var("FPGRARS") {
        let must_halt = !asm.contains("\nSys.init:\n");
        errors.push_str(&run_fpgrars(&fpgrars, &asm_path, must_halt));
    }

    if errors.is_empty() { Ok(()) } else { Err(errors) }
}

/// Calcula os endereços dos símbolos do .data gerado pelo tradutor
/// (só usa ".space n" e ".word 0", sempre múltiplos de 4)
fn data_symbols(asm: &str) -> HashMap<String, i64> {
    let mut symbols = HashMap::new();
    let mut addr = DATA_BASE;
    let data = asm.split(".text").next().unwrap();

    for line in data.lines() {
        let Some((label, directive)) = line.split_once(':') else { continue };
        symbols.insert(label.trim().to_string(), addr);
        let mut parts = directive.split_whitespace();
        match parts.next() {
            Some(".space") => addr += parts.next().unwrap().parse::<i64>().unwrap(),
            Some(".word") => addr += 4,
            other => panic!("diretiva inesperada no .data: {:?}", other),
        }
    }

    symbols
}

/// Avalia um número ou "simbolo[i]"
fn eval(expr: &str, symbols: &HashMap<String, i64>) -> Result<i64, String> {
    if let Ok(value) = expr.parse() {
        return Ok(value);
    }

    let (symbol, index) = match expr.split_once('[') {
        Some((symbol, rest)) => (symbol, rest.trim_end_matches(']').parse::<i64>().unwrap()),
        None => (expr, 0),
    };

    symbols
        .get(symbol)
        .map(|addr| addr + 4 * index)
        .ok_or(format!("  símbolo desconhecido: {}", symbol))
}

/// Executa no FPGRARS por até 2 s e retorna o erro, se houver.
/// Com must_halt, não terminar nesse tempo também é erro.
fn run_fpgrars(fpgrars: &str, asm_path: &Path, must_halt: bool) -> String {
    let mut child = Command::new(fpgrars)
        .arg("--no-video")
        .arg(asm_path)
        .stdout(Stdio::null())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();

    let start = Instant::now();
    loop {
        if let Some(status) = child.try_wait().unwrap() {
            let mut stderr = String::new();
            std::io::Read::read_to_string(child.stderr.as_mut().unwrap(), &mut stderr).unwrap();
            if !status.success() || stderr.contains("error") {
                return format!("  erro no FPGRARS ({}):\n{}\n", status, stderr);
            }
            return String::new();
        }
        if start.elapsed() > Duration::from_secs(2) {
            // ainda rodando: esperado só no laço infinito do Sys.init
            let _ = child.kill();
            let _ = child.wait();
            if must_halt {
                return "  o FPGRARS não terminou em 2 s\n".to_string();
            }
            return String::new();
        }
        thread::sleep(Duration::from_millis(20));
    }
}
