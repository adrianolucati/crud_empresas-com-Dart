import 'dart:io';

import 'package:crud_empresas/pessoafisica.dart';

void optionOne() {
  String inputType = '';
  String inputFirtName = '-1';
  String inputLastName = '-1';
  String inputBirthDate = '-1';
  String inputDocumento = '-1';

  while (inputType != 'Pessoa Fisica' && inputType != 'Pessoa Juridica') {
    // Valida entrada do campo 'Tipo de Pessoa'
    print(
        "Informe o número da opção desejada:\n1. Pessoa Fisica\n2. Pessoa Juridica\n\n0. Retornar ao menú inicial");
    inputType = stdin.readLineSync()!;

    if (inputType == '1') {
      inputType = 'Pessoa Fisica';
    } else if (inputType == '2') {
      inputType = 'Pessoa Juridica';
    }
  }

  while (
      inputFirtName == '-1' || double.tryParse(inputFirtName)?.isNaN == false) {
    // Valida entrada do campo 'Primeiro Nome'
    print(
        "Informe o Primerio None ou;\n número 0 para Retornar ao menú inicial");
    inputFirtName = stdin.readLineSync()!;

    if (inputFirtName.isEmpty) {
      inputFirtName = '-1';
    }
  }

  while (
      inputLastName == '-1' || double.tryParse(inputLastName)?.isNaN == false) {
    // Valida entrada do campo 'Último Nome'
    print("Informe o Sobrenome ou;\n número 0 para Retornar ao menú inicial");
    inputLastName = stdin.readLineSync()!;

    if (inputLastName.isEmpty) {
      inputLastName = '-1';
    }
  }

  while (inputDocumento == '-1' ||
      double.tryParse(inputDocumento)?.isNaN == true) {
    // Valida entrada do campo 'Último Nome'
    print(
        "Informe a Data de Nascimentn (formato: Ano/Mês/Dia) ou;\n número 0 para Retornar ao menú inicial");
    inputBirthDate = stdin.readLineSync()!;

    if (inputBirthDate.isEmpty) {
      inputBirthDate = '-1';
    }
  }

  while (inputDocumento == '-1' ||
      double.tryParse(inputDocumento)?.isNaN == true) {
    // Valida entrada do campo 'Último Nome'
    print("Informe o CPF/CNPJ ou;\n número 0 para Retornar ao menú inicial");
    inputDocumento = stdin.readLineSync()!;

    if (inputDocumento.isEmpty) {
      inputDocumento = '-1';
    }
  }

  PessoaFisica pessoa = PessoaFisica("PF",
      firstName: "Adriano",
      lastName: "Lucati",
      birthDate: DateTime.parse("1992-03-21"),
      cpf: "78901286904");

  print(
      "${pessoa.tipo}\n${pessoa.firstName}\n${pessoa.lastName}\n${pessoa.birthDate}\n${pessoa.cpf}\n${pessoa.id}\n${pessoa.dataCadastro}");

  print("Verificação: ${pessoa.validarCPF(pessoa.cpf)}");
}
