import 'dart:io';
import 'package:crud_empresas/endereco.dart';
import 'package:crud_empresas/homeMenu.dart';

Endereco getInputAddress() {
  String cep = '-1';
  String titulo = '-1';
  String tipoLogradouro = '-1';
  String logradouro = '-1';
  String numero = '-1';
  String bairro = '-1';
  String cidade = '-1';
  String uf = '-1';
  String pais = '-1';
  String complemento = '';

  while (titulo == '-1' || double.tryParse(titulo)?.isNaN == false) {
    print("Descrição do endereço (Casa, Apto, Trabalho, Comercial, etc..)");

    titulo = stdin.readLineSync()!;
  }

  while (tipoLogradouro == '-1' ||
      double.tryParse(tipoLogradouro)?.isNaN == false) {
    print("Tipo de Logradouro (Rua, Avenida, Viela, ");

    tipoLogradouro = stdin.readLineSync()!;
  }

  while (cep.length != 8 || double.tryParse(cep)?.isNaN == false) {
    print("Informe o CEP com 8 digitos (somente números)");

    cep = stdin.readLineSync()!;
  }

  while (logradouro == '-1' || double.tryParse(logradouro)?.isNaN == false) {
    print("Informe endereço, $tipoLogradouro:");

    logradouro = stdin.readLineSync()!;
  }

  while (numero.isEmpty ||
      numero.length > 5 ||
      double.tryParse(numero)?.isNaN == false) {
    print("Informe o número (somente números)");

    numero = stdin.readLineSync()!;
  }

  while (bairro == '-1' || double.tryParse(bairro)?.isNaN == false) {
    print("Informe o bairro:");

    bairro = stdin.readLineSync()!;
  }

  while (cidade == '-1' || double.tryParse(cidade)?.isNaN == false) {
    print("Informe a cidade:");

    cidade = stdin.readLineSync()!;
  }

  while (uf == '-1' || double.tryParse(uf)?.isNaN == false) {
    print("Informe o Estado (UF):");

    uf = stdin.readLineSync()!;
  }

  while (pais == '-1' || double.tryParse(pais)?.isNaN == false) {
    print("Informe o Pais:");

    pais = stdin.readLineSync()!;
  }

  while (complemento == '-1' || double.tryParse(complemento)?.isNaN == false) {
    print("Complemento (apto, fundo, esquina..):");

    complemento = stdin.readLineSync()!;
  }

  return Endereco(
      cep: cep,
      titulo: titulo,
      tipoLogradouro: tipoLogradouro,
      logradouro: logradouro,
      numero: int.parse(numero),
      bairro: bairro,
      cidade: cidade,
      uf: uf,
      pais: pais);
}

List<Endereco>? consultAddress(String endereco) {
  List<Endereco>? enderecosEncontrados;

  for (var element in listAddress) {
    if (element.logradouro.contains(endereco) ||
        element.bairro.contains(endereco) ||
        element.cidade.contains(endereco) ||
        element.pais.contains(endereco)) {
      enderecosEncontrados?.add(element);
    }
  }
  return enderecosEncontrados;
}
