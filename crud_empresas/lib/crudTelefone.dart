import 'dart:io';

import 'package:crud_empresas/homeMenu.dart';
import 'package:crud_empresas/telefone.dart';

Telefone getInputPhone() {
  String ddd = '-1';
  String numero = '-1';
  String tipo = '-1';

  while (tipo == '-1' || double.tryParse(tipo)?.isNaN == false) {
    print(
        "Qual tipo de telefone?\nDigite: whatsapp OU\n celular OU\n fixo OU\n comercial");

    tipo = stdin.readLineSync()!;
  }

  while (ddd.length != 2 || double.tryParse(ddd)?.isNaN == false) {
    print("Informe o DDD com 2 digitos (somente números)");

    ddd = stdin.readLineSync()!;
  }

  while (numero.length < 8 ||
      numero.length > 9 ||
      double.tryParse(numero)?.isNaN == false) {
    print("Informe o número com 8 ou 9 digitos (somente números)");

    numero = stdin.readLineSync()!;
  }
  return Telefone(ddd: ddd, numero: numero, tipo: tipo);
}

List<Telefone>? consultPhone(String? ddd, String? numero) {
  List<Telefone>? telefonesEncontrados;

  for (var element in listPhone) {
    if (element.ddd.contains(ddd!) || element.numero.contains(numero!)) {
      telefonesEncontrados?.add(element);
    }
  }
  return telefonesEncontrados;
}
