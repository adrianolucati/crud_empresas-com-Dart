import 'dart:io';

import 'subMenu.dart';

import 'homeMenu.dart';

optionSix() {
  String option = stdin.readLineSync()!;

  switch (option) {
    case '1':
      print("então tah, flw !!!\n\n");
      break;
    case '0':
      menuInicial();
      break;
    default:
      subMenuOpcao6();
  }
}
