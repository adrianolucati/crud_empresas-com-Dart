import 'package:crud_empresas/endereco.dart';

class ListaEnderecos {
  List<Endereco> enderecos = [];

  void adicionarEndereco(Endereco endereco) {
    enderecos.add(endereco);
  }

  void listarEnderecos() {
    // for (var i = 0; i < enderecos.length; i++) {
    //   print("${enderecos.}");
    // }
    for (var endereco in enderecos) {
      print(endereco.enderecoCompleto);
    }
  }

  String buscarEnderecoID(String idEnderecoBuscar) {
    for (var i = 0; i < enderecos.length; i++) {
      if (enderecos[i].id == idEnderecoBuscar) {
        print("achou!");
        return enderecos[i].enderecoCompleto;
      }
    }
    return 'ID não existe na lista de endereços!';
  }

  void removerEndereco(String idEnderecoRemover) {
    for (var i = 0; i < enderecos.length; i++) {
      if (enderecos[i].id == idEnderecoRemover) {
        print("achou!");
        enderecos.removeAt(i);
      }
    }
    print('ID não existe na lista de endereços!');
    // enderecos.forEach((Endereco endereco) =>
    //     enderecos.remove(endereco.id == idEnderecoRemover));
  }
}
