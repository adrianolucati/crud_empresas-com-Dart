import 'package:crud_empresas/telefone.dart';

class ListaTelefones {
  List<Telefone> telefones = [];

  void adicionarTelefone(Telefone telefone) {
    telefones.add(telefone);
  }

  void listarTelefones() {
    for (var telefone in telefones) {
      print(telefone.telefoneFormatado);
    }
  }

  String buscarTelefoneID(String idEnderecoBuscar) {
    for (var i = 0; i < telefones.length; i++) {
      if (telefones[i].id == idEnderecoBuscar) {
        print("achou!");
        return telefones[i].telefoneFormatado;
      }
    }
    return 'ID não existe na lista de telefones!';
  }

  void removerTelefone(String idTelefoneoRemover) {
    for (var i = 0; i < telefones.length; i++) {
      if (telefones[i].id == idTelefoneoRemover) {
        print("achou!");
        telefones.removeAt(i);
      }
    }
    print('ID não existe na lista de telefones!');
  }
}
