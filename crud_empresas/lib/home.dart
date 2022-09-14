import 'dart:io';

import 'package:crud_empresas/secretMenu.dart';
import 'package:crud_empresas/subMenu.dart';

void menuInicial() {
  print(
      "---------- MENU INICIAL ----------------------------------------------------\n"
      "1. Cadastrar uma nova empresa OU sócio\n"
      "2. Buscar Empresa cadastrada por CNPJ\n"
      "3. Buscar Empresa por CPF/CNPJ do Sócio\n"
      "4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n"
      "5. Excluir uma empresa (por ID)\n"
      "6. Sair\n");

  String inputOption = '-1';

  inputOption = stdin.readLineSync()!;

  switch (inputOption) {
    case '1':
      break;
    case '2':
      print('Opção 2');
      break;
    case '3':
      print('Opção 3');
      break;
    case '4':
      print('Opção 4');
      break;
    case '5':
      print('Opção 5');
      break;
    case '6':
      subMenuOpcao6();
      break;
    case 'afl':
      secretMenu();
      break;

    default:
      menuInicial();
      break;
  }
}
