import 'dart:io';

import 'package:crud_empresas/homeMenu.dart';
import 'package:crud_empresas/pessoajuridica.dart';

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

  PessoaJuridica pj = PessoaJuridica(tipo,
      razaoSocial: inputSocialReason,
      nomeFantasia: inputFantasyName,
      documentoSocio: inputPartnerDocument,
      cnpj: inputDocument);
  return pj;
}

void editarEmpresa(String id) {
  for (var element in listCompany) {
    if (element.id == id) {
      print(buscarEmpresaCNPJ(cnpj: element.cnpj, documentoSocio: null));

      element = validarDadosPJ("PJ");
    }
  }
}

PessoaJuridica? buscarEmpresaCNPJ({String? cnpj, String? documentoSocio}) {
  // print('Opção 2 - Buscar Empresa cadastrada por CNPJ\n\n');
  String numero = '-1';

  numero = (cnpj!.isEmpty ? documentoSocio : cnpj)!;

  while (numero.length != 11 && numero.length != 14) {
    print("Informe CPF ou CNPJ da empresa ou do sócio");
    numero = stdin.readLineSync()!;
  }

  for (var element in listCompany) {
    if (element.cnpj == numero) {
      print("ID: ${element.id}\n"
          "Razão Social: ${element.razaoSocial}\n"
          "Nome Fantasia: ${element.nomeFantasia}\n"
          "CNPJ: ${element.cnpj}\n"
          "CPF/CNPJ do Sócio: ${element.documentoSocio}\n"
          "ID Telefone: ${element.uuidTelefone}\n"
          "ID Endereço: ${element.uuidEndereco}\n");
      return element;
    } else {
      return null;
    }
  }
  return null;
}

void listarEmpresasEmOrdem({bool? ascending = true}) {
  List<PessoaJuridica> listCompanySorted = listCompany;

  if (ascending == true) {
    listCompanySorted.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
  } else if (ascending == false) {
    listCompanySorted.sort((a, b) => b.razaoSocial.compareTo(a.razaoSocial));
  } else {
    print("Listando empresas na ordem original");
  }
  for (var element in listCompanySorted) {
    print("--------------------------------------------------\n"
        "ID: ${element.id}\n"
        "Razão Social ${element.razaoSocial}\n"
        "CNPJ: ${element.cnpj}\n"
        "Sócio: ${element.documentoSocio}\n\n");
  }
}
