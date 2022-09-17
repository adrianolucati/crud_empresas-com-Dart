import 'package:crud_empresas/pessoafisica.dart';

class ListaPessoas {
  List<PessoaFisica> pessoas = [];

  ListaPessoas(this.pessoas);

  get getPessoas {
    return pessoas;
  }

  void listarPessoas() {
    // for (var i = 0; i < pessoas.length; i++) {
    //   print("${pessoas.}");
    // }
    for (var pessoa in pessoas) {
      print(pessoa.firstName);
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
