import 'dart:io';
import 'package:crud_empresas/crudEndereco.dart';
import 'package:crud_empresas/crudPessoaFisica.dart';
import 'package:crud_empresas/crudPessoaJuridica.dart';
import 'package:crud_empresas/crudTelefone.dart';
import 'package:crud_empresas/endereco.dart';
import 'package:crud_empresas/pessoafisica.dart';
import 'package:crud_empresas/pessoajuridica.dart';
import 'package:crud_empresas/secretMenu.dart';
import 'package:crud_empresas/subMenu.dart';
import 'package:crud_empresas/telefone.dart';

String inputOption = '-1';
List<PessoaFisica> listPeople = [];
List<PessoaJuridica> listCompany = [];
List<Endereco> listAddress = [];
List<Telefone> listPhone = [];
dynamic returnObjectPerson;

void menuInicial() {
  print(
      "---------- MENU INICIAL ----------------------------------------------------\n");
  print("1. Cadastrar uma nova empresa OU sócio\n");
  print("2. Buscar Empresa cadastrada por CNPJ\n");
  print("3. Buscar Empresa por CPF/CNPJ do Sócio\n");
  print(
      "4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n");
  print("5. Excluir uma empresa (por ID)\n");
  print("6. Acessar dados de Empresa/Socios \n");
  print("0. Sair\n");

  inputOption = stdin.readLineSync()!;
  String razaoSocialExcluir = 'ID EMPRESA NÃO ENCONTRADO';

  switch (inputOption) {
    case '1':
      print("\n-----------------------------------------------------\n"
          "Opção 1 - Cadastrar uma nova empresa OU sócio\n\n");
      returnObjectPerson = subMenuOpcao1();

      if (returnObjectPerson.runtimeType == PessoaFisica) {
        print("Retorno menú inicial Pessoa Fisica");
        listPeople.add(returnObjectPerson);
        menuInicial();
      } else if (returnObjectPerson.runtimeType == PessoaJuridica) {
        print("Retorno menú inicial Pessoa Juridica");
        listCompany.add(returnObjectPerson);
        menuInicial();
      } else {
        print("Erro: Objeto retorno tipo ${returnObjectPerson.runtimeType}");
        menuInicial();
      }
      break;
    case '2':
      if (listCompany.isEmpty) {
        print('Nenhuma empresa cadastrada');
      } else {
        print('Opção 2 - Buscar Empresa cadastrada por CNPJ\n\n');
        buscarEmpresaCNPJ(cnpj: null, documentoSocio: null);
      }
      menuInicial();
      break;
    case '3':
      if (listCompany.isEmpty) {
        print('Nenhuma empresa cadastrada');
        menuInicial();
      } else {
        print('Opção 3 - Buscar Empresa por CPF/CNPJ do Sócio\n\n');
        buscarEmpresaCNPJ(cnpj: null, documentoSocio: null);
      }
      menuInicial();
      break;
    case '4':
      if (listCompany.isEmpty) {
        print('Nenhuma empresa cadastrada');
        menuInicial();
      } else {
        while (inputOption != '1' && inputOption != '2' && inputOption != '3') {
          print(
              'Opção 4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n'
              '1. Ascendente\n'
              '2. Descendente\n'
              '3. Listar ordem original\n'
              '0. Voltar\n');
          inputOption = stdin.readLineSync()!;
        }

        if (inputOption != '1') {
          listarEmpresasEmOrdem(ascending: true);
        } else if (inputOption != '2') {
          listarEmpresasEmOrdem(ascending: false);
        } else if (inputOption != '3') {
          listarEmpresasEmOrdem(ascending: null);
        }
      }
      menuInicial();
      break;
    case '5':
      if (listCompany.isEmpty) {
        print('Nenhuma empresa cadastrada');
        menuInicial();
      } else {
        print("\n-----------------------------------------------------\n"
            "Opção 5 - Excluir uma empresa (por ID)\n\n");
        String idExcluir = '-1';
        String decisao = '-1';

        while (idExcluir == '-1') {
          print("Digite o ID da empresa para excluir");
          idExcluir = stdin.readLineSync()!;
        }

        for (var element in listCompany) {
          if (element.id == idExcluir) {
            razaoSocialExcluir = element.razaoSocial;
          }
        }

        while (decisao.toLowerCase() != 's' && decisao.toLowerCase() != 'n') {
          print("Razão Social: $razaoSocialExcluir");
          print("Confirmar exclusão?\n(s) Sim\n(n) Não");
          decisao = stdin.readLineSync()!;
        }

        if (decisao == 's') {
          listCompany.removeWhere((element) => element.id == idExcluir);
          print('Empresa excluída com sucesso!\n\n');
        } else {
          print('Usuário desistiu de excluir a empresa!\n\n');
        }
      }
      menuInicial();
      break;
    case '6':
      while (inputOption != '0' &&
          inputOption != '1' &&
          inputOption != '2' &&
          inputOption != '3' &&
          inputOption != '4') {
        print("1. Editar Empresa");
        print("2. Editar Sócio");
        print("3. Cadastrar Endereço");
        print("4. Cadastrar Telefone");
        print("0. Voltar");
      }

      if (inputOption == '0') {
        // Voltar menu inicial
        menuInicial();
      } else if (inputOption == '1') {
        //Editar empresa
        String idEmpresa = '-1';
        editarEmpresa(idEmpresa);
      } else if (inputOption == '2') {
        // Editar sócio
        String idSocio = '-1';
        editarSocio(idSocio);
      } else if (inputOption == '3') {
        // Cadastrar endereço
        if (getInputAddress().runtimeType == Endereco) {
          listAddress.add(getInputAddress());
          print("Novo endereço cadastrado!\n\n");
        }
      } else if (inputOption == '4') {
        // Cadastrar telefone
        if (getInputPhone().runtimeType == Telefone) {
          listPhone.add(getInputPhone());
          print("Novo telefone cadastrado!\n\n");
        }
        ;
      } else {
        print("Opção inválida: $inputOption!");
      }

      break;
    case '0':
      subMenuOpcao6();
      break;
    case 'afl': // Menu para validação unitária de métodos
      secretMenu();
      break;

    default:
      menuInicial();
      break;
  }
}
