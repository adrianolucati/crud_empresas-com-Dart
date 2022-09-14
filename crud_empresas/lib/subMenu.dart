import 'dart:io';

import 'package:crud_empresas/home.dart';

void subMenuOpcao1() {
  print("\n-----------------------------------------------------\n"
      "Opção 1 - Cadastrar uma nova empresa OU sócio\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa");
}

void subMenuOpcao2() {
  print("\n-----------------------------------------------------\n"
      "Opção 2 - Buscar Empresa cadastrada por CNPJ\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa");
}

void subMenuOpcao3() {
  print("\n-----------------------------------------------------\n"
      "Opção 3 - Buscar Empresa por CPF/CNPJ do Sócio\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa");
}

void subMenuOpcao4() {
  print("\n-----------------------------------------------------\n"
      "Opção 4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa");
}

void subMenuOpcao5() {
  print("\n-----------------------------------------------------\n"
      "Opção 5 - Excluir uma empresa (por ID)\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa");
}

void subMenuOpcao6() {
  print("\n-----------------------------------------------------\n"
      "Opção 6 - Sair\n******* TEM CERTEZA? *******\n\n"
      "1. Confirmar saída\n"
      "0. Voltar ao menú inicial\n");

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
