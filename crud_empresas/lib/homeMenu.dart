import 'dart:io';
import 'package:crud_empresas/endereco.dart';
import 'package:crud_empresas/listaEmpresas.dart';
import 'package:crud_empresas/listaEnderecos.dart';
import 'package:crud_empresas/listaPessoas.dart';
import 'package:crud_empresas/listaTelefones.dart';
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
  print("6. Sair\n");

  inputOption = stdin.readLineSync()!;

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
        menuInicial();
      } else {
        print('Opção 2 - Buscar Empresa cadastrada por CNPJ\n\n');
        String cnpj = '-1';

        while (cnpj.length != 11 && cnpj.length != 14) {
          cnpj = stdin.readLineSync()!;
        }

        for (var element in listCompany) {
          if (element.cnpj == cnpj) {
            print("Razão Social: ${element.razaoSocial}");
          }
        }
        menuInicial();
      }
      break;
    case '3':
      if (listCompany.isEmpty) {
        print('Nenhuma empresa cadastrada');
        menuInicial();
      } else {
        print('Opção 3 - Buscar Empresa por CPF/CNPJ do Sócio\n\n');
        String documentoSocio = '-1';

        while (documentoSocio.length != 11 && documentoSocio.length != 14) {
          documentoSocio = stdin.readLineSync()!;
        }

        for (var element in listCompany) {
          if (element.documentoSocio == documentoSocio) {
            print("Razão Social: ${element.razaoSocial}");
          }
        }
      }
      break;
    case '4':
      if (listCompany.isEmpty) {
        print('Nenhuma empresa cadastrada');
        menuInicial();
      } else {
        print(
            'Opção 4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n\n');
        for (var element in listCompany) {
          print("--------------------------------------------------\n"
              "ID: ${element.id}\n"
              "Razão Social ${element.razaoSocial}\n"
              "CNPJ: ${element.cnpj}\n"
              "Sócio: ${element.documentoSocio}\n\n");
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
          idExcluir = stdin.readLineSync()!;
        }

        for (var element in listCompany) {
          if (element.id == idExcluir) {
            print("Razão Social: ${element.razaoSocial}");
          }
        }

        while (decisao.toLowerCase() != 's' && decisao.toLowerCase() != 'n') {
          decisao = stdin.readLineSync()!;
        }

        if (decisao == 's') {
          listCompany.removeWhere((element) => element.id == idExcluir);
          print('Empresa excluída com sucesso!');
        } else {
          print('Usuário desistiu de excluir a empresa!');
        }
      }
      menuInicial();
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
