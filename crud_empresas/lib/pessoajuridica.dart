import 'package:crud_empresas/pessoa.dart';

class PessoaJuridica extends Pessoa {
  late String razaoSocial;
  late String nomeFantasia;
  late String documentoSocio;
  late String cnpj;

  PessoaJuridica(super.tipo,
      {required this.razaoSocial,
      required this.nomeFantasia,
      required this.documentoSocio,
      required this.cnpj});

  String get dadosPessoaJuridica {
    return "ID: $id\n"
        "Tipo:  $tipo || CNPJ: $cnpj\n"
        "Nome completo: $razaoSocial $nomeFantasia\n"
        "Nascimento: $documentoSocio || Cadastro: $dataCadastro\n"
        "ID Endereço: $uuidEndereco\n"
        "ID Telefone: $uuidTelefone";
  }

  bool validarCNPJ(String cnpj) {
    if (cnpj.length != 11 && int.tryParse(cnpj) == null) {
      return false;
    }

    int primeiroDigito = int.parse(cnpj.substring(9, 10));

    int segundoDigito = int.parse(cnpj.substring(10));

    if (validaDigito(novePrimeirosNumeros: cnpj.substring(0, 9)) ==
        primeiroDigito) {
      if (validaDigito(dezPrimeirosNumeros: cnpj.substring(0, 10)) ==
          segundoDigito) {
        return true;
      }
    }
    return false;
  }

  int validaDigito(
      {String? novePrimeirosNumeros, String? dezPrimeirosNumeros}) {
    int resto = -1;
    bool digitosRepetidos = true;

    String? numerosParaCalculo = novePrimeirosNumeros ?? dezPrimeirosNumeros;

    if (numerosParaCalculo != null) {
      for (int i = 0; i < numerosParaCalculo.length - 1; i++) {
        int digitoAtual = int.parse(numerosParaCalculo.substring(i, i + 1));
        int proximoDigito =
            int.parse(numerosParaCalculo.substring(i + 1, i + 2));

        if (digitoAtual != proximoDigito) {
          digitosRepetidos = false;
        }
      }

      int p = 0;
      int soma = 0;

      // Calculo de validação dos digitos do CNPJ
      if (digitosRepetidos == false) {
        for (int i = numerosParaCalculo.length + 1; i > 1; i--) {
          int digitoAtual = int.parse(numerosParaCalculo.substring(p, p + 1));

          soma += digitoAtual * i;
          p++;
        }

        resto = (soma * 10 % 11);

        resto == 10 ? resto = 0 : '';
      }
    }

    return resto;
  }
}
