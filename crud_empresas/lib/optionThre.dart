import 'dart:io';

import 'package:crud_empresas/listaEmpresas.dart';
import 'package:crud_empresas/pessoajuridica.dart';
import 'package:crud_empresas/subMenu.dart';

String optionThre(String documentoSocio) {
  String inputText = stdin.readLineSync()!;

  while (inputText.length != 11 && inputText.length != 14) {
    subMenuOpcao3(documentoSocio);
  }

  return inputText;
}
