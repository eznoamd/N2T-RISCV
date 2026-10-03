use std::fs;
use std::path::{Path, PathBuf};

use crate::code_writer::CodeWriter;
use crate::os::{self, Body};
use crate::parser::{clean_line, parse_command, CommandType};

/// Recebe o caminho informado pelo usuário 
/// 
/// Encaminha para translate_file se for um arquivo vm 
/// Encaminha para translate_directory se for uma pasta 
pub fn translate(input: &str) -> Result<(), String> {
    let input_path = Path::new(input);

    // se o arquivo/dir não existe retorna um erro
    if !input_path.exists() {
        return Err("caminho não encontrado".to_string());
    }

    // se for um arquivo
    if input_path.is_file() {
        translate_file(input_path)
    }
    // se for um diretório
    else if input_path.is_dir() {
        translate_directory(input_path)
    }
    // caso não seja nem arquivo nem diretório retorna um erro
    else {
        Err("entrada inválida".to_string())
    }
}

/// Traduz um único arquivo .vm
fn translate_file(input_path: &Path) -> Result<(), String> {

    // verifica se o arquivo tem ".vm" no final e retorna erro caso não
    if input_path.extension().and_then(|ext| ext.to_str()) != Some("vm") {
        return Err("o arquivo de entrada deve ter extensão .vm".to_string());
    }

    // cria o caminho do novo arquivo com a extensão .s
    let output_path = input_path.with_extension("s");

    translate_files(&[input_path.to_path_buf()], &output_path)
}

/// Traduz todos os arquivos .vm de um diretório
fn translate_directory(input_path: &Path) -> Result<(), String> {

    // procura todos os arquivos .vm existentes na pasta
    let vm_files = get_vm_files(input_path);

    // verifica se encontrou pelo menos um arquivo .vm
    if vm_files.is_empty() {
        return Err("nenhum arquivo .vm encontrado no diretório".to_string());
    }

    // pega o nome do diretório
    // exemplo: ./FunctionCalls -> FunctionCalls
    let directory_name = input_path
        .file_name()
        .ok_or("erro ao obter nome do diretório")?
        .to_string_lossy()
        .to_string();

    // O arquivo .s terá o mesmo nome da pasta
    //
    // FunctionCalls/
    //     Main.vm
    //     Sys.vm
    //
    // vira: FunctionCalls.s
    let output_path = input_path
        .parent()
        .unwrap_or(Path::new("."))
        .join(format!("{}.s", directory_name));

    translate_files(&vm_files, &output_path)
}

/// Traduz uma lista de arquivos .vm para um único arquivo .s
///
/// Estrutura do arquivo gerado:
///
/// .data   -> temp, statics, RAM da VM e pilha
/// .text   -> bootstrap (chama Sys.init se existir)
///            código de todos os .vm
///            vm_halt (encerramento)
fn translate_files(vm_files: &[PathBuf], output_path: &Path) -> Result<(), String> {

    // cria um único CodeWriter para todos os arquivos .vm
    let mut writer = CodeWriter::new(String::new());

    // variável que guarda o código gerado
    // pelos vários arquivos .vm
    let mut code = String::new();

    // percorre todos os arquivos .vm
    for vm_file in vm_files {

        // pega apenas o nome do arquivo, sem ".vm"
        // exemplo: Main.vm -> Main
        let file_name = vm_file
            .file_stem()
            .ok_or("erro ao obter nome do arquivo")?
            .to_string_lossy()
            .to_string();

        // informa ao CodeWriter qual arquivo está sendo traduzido
        writer.set_file_name(file_name);

        // lê o conteúdo do arquivo .vm
        let content = fs::read_to_string(vm_file)
            .map_err(|e| {
                format!(
                    "erro ao ler {}: {}",
                    vm_file.display(),
                    e
                )
            })?;

        // repassa a responsabilidade de escrever em code com o writer
        // para o translate_content
        translate_content(
            &content,
            &mut writer,
            &mut code,
        );
    }

    // completa o programa com as funções do mini SO que faltam
    include_os(&mut writer, &mut code)?;

    // o .data e o bootstrap só podem ser gerados no final:
    // os statics usados e a existência de Sys.init
    // só são conhecidos depois de traduzir tudo
    let mut output = writer.write_data();
    output.push('\n');
    output.push_str(&writer.write_init());
    output.push('\n');
    output.push_str(&code);
    output.push_str(&writer.write_halt());

    // escreve todo o Assembly gerado no arquivo de saída
    fs::write(output_path, output)
        .map_err(|e| format!("erro ao escrever arquivo: {}", e))?;

    println!(
        "Tradução concluída: {}",
        output_path.display()
    );

    Ok(())
}

/// Adiciona ao código as funções do mini SO (src/os.rs) que o programa
/// chama mas não define, e as dependências delas.
///
/// Se o programa tem Main.main mas não tem Sys.init, o Sys.init do mini SO
/// é incluído para servir de ponto de entrada (como no SO do Hack).
fn include_os(writer: &mut CodeWriter, code: &mut String) -> Result<(), String> {
    if writer.is_defined("Main.main") && !writer.is_defined("Sys.init") {
        writer.mark_called("Sys.init");
    }

    let mut asm = String::new();

    // repete até não faltar nada: funções incluídas podem chamar outras
    loop {
        let missing = writer.missing_functions();
        if missing.is_empty() {
            break;
        }

        let unknown: Vec<&String> = missing.iter().filter(|name| os::find(name).is_none()).collect();
        if !unknown.is_empty() {
            let names: Vec<&str> = unknown.iter().map(|name| name.as_str()).collect();
            return Err(format!(
                "funções chamadas mas não definidas (nem no mini SO): {}",
                names.join(", ")
            ));
        }

        for name in &missing {
            let function = os::find(name).unwrap();

            match function.body {
                // código VM: traduzido como se fosse mais um arquivo
                Body::Vm(source) => {
                    writer.set_file_name("OS".to_string());
                    translate_content(source, writer, code);
                }
                Body::Asm(source) => {
                    writer.mark_defined(function.name);
                    asm.push_str(source);
                    asm.push('\n');
                }
            }

            for dep in function.deps {
                writer.mark_called(dep);
            }
        }
    }

    // as funções em assembly usam o os_return/os_fail e os dados do mini SO
    if !asm.is_empty() {
        code.push_str("# ===== mini SO =====\n");
        code.push_str(os::COMMON);
        code.push('\n');
        code.push_str(&asm);

        for line in os::DATA {
            writer.add_data(line);
        }
    }

    Ok(())
}

/// Obtém todos os arquivos .vm de um diretório
fn get_vm_files(directory: &Path) -> Vec<PathBuf> {
    // vetor que vai armazenar os caminhos dos arquivos .vm
    let mut files = Vec::new();

    // lê todas as entradas existentes no diretório
    let entries = fs::read_dir(directory)
        .expect("erro ao ler diretório");

    // percorre cada entrada encontrada
    for entry in entries {

        // obtém a entrada atual
        let entry = entry.expect("erro ao ler entrada");

        // obtém o caminho da entrada
        let path = entry.path();

        // verifica se é um arquivo e se possui extensão .vm
        if path.is_file()
            && path.extension().and_then(|ext| ext.to_str()) == Some("vm")
        {
            // adiciona o arquivo à lista
            files.push(path);
        }
    }

    // ordena os arquivos para que a ordem de tradução
    // seja sempre determinística
    files.sort();

    files
}

/// Traduz o conteúdo de um arquivo VM
/// usando o CodeWriter recebido.
fn translate_content(content: &str, writer: &mut CodeWriter,output: &mut String,) {
    // para cada linha do arquivo .vm
    for line in content.lines() {

        // remove comentários e espaços em branco
        let cleaned = clean_line(line);

        // ignora linhas vazias ou que continham apenas comentários
        if cleaned.is_empty() {
            continue;
        }

        // transforma a linha em um Command
        // identificando o tipo e seus argumentos
        let command = parse_command(&cleaned);

        // verifica qual tipo de comando foi encontrado
        // e chama a função correspondente do CodeWriter
        let assembly = match command.command_type {
            CommandType::Arithmetic => {
                writer.write_arithmetic(&command.arg1)
            }
            CommandType::Push | CommandType::Pop => {
                writer.write_push_pop(
                    &command.command_type, // centralizei os dois no mesmo, então é feito uma verificação  
                                           // interna para encaminhar o comando pro lugar certo
                    &command.arg1,
                    command.arg2.expect("push/pop sem índice"),
                )
            }
            CommandType::Label => {
                writer.write_label(&command.arg1)
            }
            CommandType::Goto => {
                writer.write_goto(&command.arg1)
            }
            CommandType::IfGoto => {
                writer.write_if(&command.arg1)
            }
            CommandType::Function => {
                writer.write_function(
                    &command.arg1,
                    command.arg2.expect("function sem nVars"),
                )
            }
            CommandType::Call => {
                writer.write_call(
                    &command.arg1,
                    command.arg2.expect("call sem nArgs"),
                )
            }
            CommandType::Return => {
                writer.write_return()
            }
        };

        output.push_str(&assembly);

        output.push('\n');
    }
}