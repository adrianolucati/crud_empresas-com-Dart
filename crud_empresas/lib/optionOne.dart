import 'dart:io';
import 'package:crud_empresas/crudPessoaFisica.dart';
import 'package:crud_empresas/crudPessoaJuridica.dart';
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
