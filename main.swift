import Foundation 

var lista: [String] = []
var tarefa: String = ""

func listarTarefas(lista: [String], tarefa: String) -> [String] {
    let listaInterna = lista
    for i in 0..<listaInterna.count {
        print("\(i+1) - \(listaInterna[i])")
    }
    if listaInterna.isEmpty {
        print("Não tem nenhuma tarefa, adicione uma.")
    }
    return listaInterna
}

func adicionarTarefa(lista: [String], tarefa: String) -> [String] {
    var listaInterna = lista
    listaInterna.append(tarefa)
    return listaInterna
}

func removerTarefa(lista: [String], tarefa: Int) -> [String] {
    var listaInterna = lista
    listaInterna.remove(at: tarefa-1)
    return listaInterna
}

func editarTarefa(lista: [String], novaTarefa: String, tarefa: Int) -> [String] {
    var listaInterna = lista
    listaInterna[tarefa-1] = novaTarefa
    return listaInterna
}

func prioridade(lista: [String], destino: Int, origem: Int) -> [String] {
    var listaInterna = lista
    let tarefa = listaInterna.remove(at: origem-1)
    listaInterna.insert(tarefa, at: destino-1)
    return listaInterna
}

func encerrarPrograma() {
    if opcao == 0 {
    print("Encerrando o programa...")
    exit(1)
  }
}

var opcao = -1

repeat {
print("""
______________________________________________________
  === Lista de Tarefas ===
1 - Listar tarefas.
2 - Adicionar tarefa.
3 - Remover tarefa.
4 - Editar tarefa.
5 - Prioridade
0 - Sair.

Escolha uma opçao:
""")

guard let entrada = readLine(),
      let opcaoF = Int(entrada) else {
        exit(1)
}
opcao = opcaoF
print("______________________________________________________")
switch(opcao) {
    case 1:
        lista = listarTarefas(lista: lista, tarefa: "")
        break
    case 2:
        print("Adicione a nova tarefa: ")
        if let novaTarefa = readLine() {
        lista = adicionarTarefa(lista: lista, tarefa: novaTarefa)
        print("Tarefa Adicionada!")
    }
        break
    case 3:
        if lista.isEmpty {
            print("Não tem nenhuma tarefa, adicione uma.")
        } else {
            print("Digite o indice da tarefa que você deseja remover: ")
            if let indice: Int = Int(readLine()!) { 
            lista = removerTarefa(lista: lista, tarefa: indice)
            print("O indice \(indice) foi removido!")
        }
    }
        break
    case 4:
        if lista.isEmpty {
            print("Não tem nenhuma tarefa, adicione uma.")
        } else {
            print("Digite o indice da tarefa que você deseja editar: ")
        if let indice: Int = Int(readLine()!) {
            if let tarefaEditada = readLine() {
                lista = editarTarefa(lista: lista, novaTarefa: tarefaEditada, tarefa: indice)
            print("o Indice \(indice) foi editado!")
            }
        }
    }
        break
    case 5:
        if lista.isEmpty {
            print("Não tem nenhuma tarefa, adicione uma.")
        } else {
            print("Digite o indice de origem que você quer mover: ")
            if let indiceOrigem: Int = Int(readLine()!) {
                if let indiceDestino: Int = Int(readLine()!) {
                    lista = prioridade(lista: lista, destino: indiceDestino, origem: indiceOrigem)    
            }
        }
    }
        break
    case 0:
        encerrarPrograma()
        break
    default:
        print("Opção inválida.")
        break
        }
    } while opcao != 0

