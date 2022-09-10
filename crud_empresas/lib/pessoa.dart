abstract class Pessoa {
  late String id;
  List<String> uuidEndereco = [];
  List<String> uuidTelefone = [];

  // Pessoa(
  //   required this.id;
  //   this.uuidEndereco;
  //   this.uuidTelefone;
  // )

  void adicionarEndereco(String uuidEndereco) {
    this.uuidEndereco.add(uuidEndereco);
  }

  void adicionarTelefone(String uuidTelefone) {
    this.uuidTelefone.add(uuidTelefone);
  }

  void deletarTelefone(String uuidTelefone) {
    final int qtde = this.uuidTelefone.length;

    print('ID Telefone: $uuidTelefone');

    this.uuidTelefone.remove(uuidTelefone);

    // for (int i = 0; i < uuidTelefone.length; i++) {
    //   if (this.uuidTelefone[i] == uuidTelefone) {
    //     // remover telefone
    //     return;
    //   }
    // }

    qtde > uuidTelefone.length
        ? print("Removido")
        : print("UUID Não encontrado");
  }

  void deletarEndereco(String uuidEndereco) {
    final int qtde = this.uuidEndereco.length;

    print('ID Telefone: $uuidTelefone');

    this.uuidEndereco.remove(uuidEndereco);

    qtde > uuidTelefone.length
        ? print("Removido")
        : print("UUID Não encontrado");
  }

  void atualizarTelefone(String uuidTelefoneAntigo, String uuidTelefoneNovo) {
    int index = -1;

    index = uuidEndereco.indexOf(uuidTelefoneAntigo);

    if (index >= 0) {
      uuidEndereco[index] = uuidTelefoneNovo;
      print(
          "Endereço atualizado\nAntigo: $uuidTelefoneAntigo\nNovo: ${uuidEndereco[index]}");
    } else {
      print("ID do endereço antigo não foi localizado!");
    }
  }

  void atualizarEndereco(String uuidEnderecoAntigo, String uuidEnderecoNovo) {
    int index = -1;

    index = uuidEndereco.indexOf(uuidEnderecoAntigo);

    if (index >= 0) {
      uuidEndereco[index] = uuidEnderecoNovo;
      print(
          "Endereço atualizado\nAntigo: $uuidEnderecoAntigo\nNovo: ${uuidEndereco[index]}");
    } else {
      print("ID do endereço antigo não foi localizado!");
    }
  }
}
