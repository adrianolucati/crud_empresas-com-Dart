import 'dart:io';
import 'package:crud_empresas/listaPessoas.dart';
import 'package:crud_empresas/homeMenu.dart';
import 'package:crud_empresas/pessoafisica.dart';
import 'package:crud_empresas/pessoajuridica.dart';
import 'package:crud_empresas/subMenu.dart';

dynamic optionOne() {
  String inputType = '';

  while (inputType != 'PF' && inputType != 'PJ' && inputType != 'Socio') {
    // Valida entrada do campo 'Tipo de Pessoa'

    inputType = stdin.readLineSync()!;

    if (inputType == '1') {
      inputType = 'PF';
      return validarDadosPF(inputType);
    } else if (inputType == '2') {
      inputType = 'PJ';
      return validarDadosPJ(inputType);
    } else if (inputType == '3') {
      inputType = 'Socio';
      return validarDadosPF(inputType);
    } else if (inputType == '0') {
      subMenuOpcao1();
    }
  }
}

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

PessoaJuridica validarDadosPJ(String tipo) {
  String inputSocialReason = '-1';
  String inputFantasyName = '-1';
  String inputPartnerDocument = '-1';
  String inputDocument = '-1';

  while (inputSocialReason == '-1' ||
      double.tryParse(inputSocialReason)?.isNaN == false) {
    // Valida entrada do campo 'Primeiro Nome'
    print(
        "Informe a RAZÃO SOCIAL ou;\n número 0 para Retornar ao menú inicial");
    inputSocialReason = stdin.readLineSync()!;

    if (inputSocialReason == '0') {
      menuInicial();
    } else if (inputSocialReason.isEmpty) {
      inputSocialReason = '-1';
    }
  }

  while (inputFantasyName == '-1' ||
      double.tryParse(inputFantasyName)?.isNaN == false) {
    // Valida entrada do campo 'Último Nome'
    print(
        "Informe o NOME FANTASIA ou;\n número 0 para Retornar ao menú inicial");
    inputFantasyName = stdin.readLineSync()!;

    if (inputFantasyName == '0') {
      menuInicial();
    } else if (inputFantasyName.isEmpty) {
      inputFantasyName = '-1';
    }
  }

  while (inputPartnerDocument == '-1' ||
      double.tryParse(inputDocument)?.isNaN == true) {
    // Valida entrada do campo 'Último Nome'
    print(
        "Informe o número de documento do sócio ou;\n0 para Retornar ao menú inicial");
    inputPartnerDocument = stdin.readLineSync()!;

    if (inputPartnerDocument == '0') {
      menuInicial();
    } else if (inputPartnerDocument.isEmpty) {
      inputPartnerDocument = '-1';
    }
  }

  while (
      inputDocument == '-1' || double.tryParse(inputDocument)?.isNaN == true) {
    // Valida entrada do campo 'Último Nome'
    print(
        "Informe o CNPJ (somente números) ou;\n número 0 para Retornar ao menú inicial");
    inputDocument = stdin.readLineSync()!;

    if (inputDocument == '0') {
      menuInicial();
    } else if (inputDocument.isEmpty) {
      inputDocument = '-1';
    }
  }

  PessoaJuridica pj = PessoaJuridica("PJ",
      razaoSocial: inputSocialReason,
      nomeFantasia: inputFantasyName,
      documentoSocio: inputPartnerDocument,
      cnpj: inputDocument);
  return pj;
}
