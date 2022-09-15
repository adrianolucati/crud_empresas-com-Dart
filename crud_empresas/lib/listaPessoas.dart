

import 'package:crud_empresas/pessoafisica.dart';

class ListaPessoas {
  List<PessoaFisica> pessoas = [];

  void adicionarPessoa(PessoaFisica pessoa) {
    pessoas.add(pessoa);
  }

  void listarPessoas() {
    // for (var i = 0; i < pessoas.length; i++) {
    //   print("${pessoas.}");
    // }
    for (var pessoa in pessoas) {
      print(pessoa.);
    }
  }

  String buscarPessoaID(String idPessoaBuscar) {
    for (var i = 0; i < pessoas.length; i++) {
      if (pessoas[i].id == idPessoaBuscar) {
        print("achou!");
        return pessoas[i].dadosPessoaFisica;
      }
    }
    return 'ID não existe na lista de endereços!';
  }

  void removerPessoa(String idPessoaRemover) {
    for (var i = 0; i < pessoas.length; i++) {
      if (pessoas[i].id == idPessoaRemover) {
        print("achou!");
        pessoas.removeAt(i);
      }
    }
    print('ID não existe na lista de endereços!');
    // pessoas.forEach((Pessoa pessoa) =>
    //     pessoas.remove(pessoa.id == idPessoaRemover));
  }
}
