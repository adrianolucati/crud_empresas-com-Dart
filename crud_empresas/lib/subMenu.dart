import 'package:crud_empresas/optionOne.dart';
import 'package:crud_empresas/optionTwo.dart';
import 'package:crud_empresas/optionThre.dart';
import 'package:crud_empresas/optionFour.dart';
import 'package:crud_empresas/optionFive.dart';
import 'package:crud_empresas/optionSix.dart';
import 'package:crud_empresas/pessoajuridica.dart';

dynamic subMenuOpcao1() {
  print("\n-----------------------------------------------------\n"
      "Opção 1 - Cadastrar uma nova empresa OU sócio\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa"
      "0. Voltar ao menú inicial\n");

  return optionOne();
}

void subMenuOpcao2() {
  print("\n-----------------------------------------------------\n"
      "Opção 2 - Buscar Empresa cadastrada por CNPJ\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa"
      "0. Voltar ao menú inicial\n");

  optionTwo();
}

void subMenuOpcao3(String documentoSocio) {
  print("\n-----------------------------------------------------\n"
      "Opção 3 - Buscar Empresa por CPF/CNPJ do Sócio\n\n"
      "Informe o número de documento do sócio\n\n"
      "0. Voltar ao menú inicial\n");

  optionThre(documentoSocio);
}

void subMenuOpcao4() {
  print("\n-----------------------------------------------------\n"
      "Opção 4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa"
      "0. Voltar ao menú inicial\n");

  optionFour();
}

void subMenuOpcao5() {
  print("\n-----------------------------------------------------\n"
      "Opção 5 - Excluir uma empresa (por ID)\n\n"
      "1. Cadastrar pessoa\n"
      "2. Cadastrar empresa\n"
      "3. Adicionar sócio a uma empresa"
      "0. Voltar ao menú inicial\n");

  optionFive();
}

void subMenuOpcao6() {
  print("\n-----------------------------------------------------\n"
      "Opção 6 - Sair\n******* TEM CERTEZA? *******\n\n"
      "1. Confirmar saída\n"
      "0. Voltar ao menú inicial\n");

  optionSix();
}
