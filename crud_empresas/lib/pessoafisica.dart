import 'package:crud_empresas/pessoa.dart';

class PessoaFisica extends Pessoa {
  late String firstName;
  late String lastName;
  late DateTime birthDate;
  late String cpf;

  PessoaFisica(super.tipo,
      {required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.cpf});

  String get dadosPessoaFisica {
    return "ID: $id\n"
        "Tipo:  $tipo || CPF: $cpf\n"
        "Nome completo: $firstName $lastName\n"
        "Nascimento: $birthDate || Cadastro: $dataCadastro\n"
        "ID Endereço: $uuidEndereco\n"
        "ID Telefone: $uuidTelefone";
  }

  bool validarCPF(String cpf) {
    if (cpf.length != 11 && int.tryParse(cpf) == null) {
      return false;
    }

    int primeiroDigito = int.parse(cpf.substring(9, 10));

    int segundoDigito = int.parse(cpf.substring(10));

    if (validaDigito(novePrimeirosNumeros: cpf.substring(0, 9)) ==
        primeiroDigito) {
      if (validaDigito(dezPrimeirosNumeros: cpf.substring(0, 10)) ==
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

      // Calculo de validação dos digitos do CPF
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
