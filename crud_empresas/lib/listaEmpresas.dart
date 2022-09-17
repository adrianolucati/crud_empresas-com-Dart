import 'package:crud_empresas/pessoajuridica.dart';

class ListaEmpresas {
  List<PessoaJuridica> empresas = [];

  ListaEmpresas(this.empresas);

  get getEmpresas {
    return empresas;
  }

  void listarEmpresas() {
    // for (var i = 0; i < empresas.length; i++) {
    //   print("${empresas.}");
    // }
    for (var empresa in empresas) {
      print(empresa.razaoSocial);
    }
  }

  String buscarEmpresaID(String idEmpresaBuscar) {
    for (var i = 0; i < empresas.length; i++) {
      if (empresas[i].id == idEmpresaBuscar) {
        print("achou!");
        return empresas[i].dadosPessoaJuridica;
      }
    }
    return 'ID não existe na lista de endereços!';
  }

  void removerEmpresa(String idEmpresaRemover) {
    for (var i = 0; i < empresas.length; i++) {
      if (empresas[i].id == idEmpresaRemover) {
        print("achou!");
        empresas.removeAt(i);
      }
    }
    print('ID não existe na lista de endereços!');
    // empresas.forEach((Pessoa empresa) =>
    //     empresas.remove(empresa.id == idEmpresaRemover));
  }
}
