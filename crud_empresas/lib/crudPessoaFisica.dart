import 'dart:io';

import 'package:crud_empresas/homeMenu.dart';
import 'package:crud_empresas/pessoafisica.dart';

PessoaFisica validarDadosPF(String tipo) {
  String inputFirtName = '-1';
  String inputLastName = '-1';
  String inputBirthDate = '-1';
  String inputDocument = '-1';

  while (
      inputFirtName == '-1' || double.tryParse(inputFirtName)?.isNaN == false) {
    // Valida entrada do campo 'Primeiro Nome'
    print(
        "Informe o Primerio None ou;\n número 0 para Retornar ao menú inicial");
    inputFirtName = stdin.readLineSync()!;

    if (inputFirtName == '0') {
      menuInicial();
    } else if (inputFirtName.isEmpty) {
      inputFirtName = '-1';
    }
  }

  while (
      inputLastName == '-1' || double.tryParse(inputLastName)?.isNaN == false) {
    // Valida entrada do campo 'Último Nome'
    print("Informe o Sobrenome ou;\n número 0 para Retornar ao menú inicial");
    inputLastName = stdin.readLineSync()!;

    if (inputLastName == '0') {
      menuInicial();
    } else if (inputLastName.isEmpty) {
      inputLastName = '-1';
    }
  }

  while (
      inputBirthDate == '-1' || double.tryParse(inputDocument)?.isNaN == true) {
    // Valida entrada do campo 'Último Nome'
    print(
        "Informe a Data de Nascimentn (formato: Ano/Mês/Dia [SOMENTE NÚMEROS]) ou;\n0 para Retornar ao menú inicial");
    inputBirthDate = stdin.readLineSync()!;

    if (inputBirthDate == '0') {
      menuInicial();
    } else if (inputBirthDate.isEmpty) {
      inputBirthDate = '-1';
    }
  }

  while (
      inputDocument == '-1' || double.tryParse(inputDocument)?.isNaN == true) {
    // Valida entrada do campo 'Último Nome'
    print(
        "Informe o CPF (somente números) ou;\n número 0 para Retornar ao menú inicial");
    inputDocument = stdin.readLineSync()!;

    if (inputDocument == '0') {
      menuInicial();
    } else if (inputDocument.isEmpty) {
      inputDocument = '-1';
    }
  }

  PessoaFisica pf = PessoaFisica("PF",
      firstName: inputFirtName,
      lastName: inputLastName,
      birthDate: DateTime.parse(inputBirthDate),
      cpf: inputDocument);

  // ListaPessoas newPerson = pf as ListaPessoas;

  print(
      "${pf.tipo}\n${pf.firstName}\n${pf.lastName}\n${pf.birthDate}\n${pf.cpf}\n${pf.id}\n${pf.dataCadastro}");

  print("Verificação: ${pf.validarCPF(pf.cpf)}");

  return pf;
}

editarSocio(String id) {}
