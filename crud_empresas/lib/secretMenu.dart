import 'dart:io';
import 'homeMenu.dart';
import 'pessoafisica.dart';

void secretMenu() {
  print("1. Validar CPF\n"
      "2. Validar CNPJ\n"
      "3. Cadastrar Endereço\n"
      "4. Cadastrar Endereço\n"
      "5. Listar pessoa fisica\n"
      "6. Listar pessoa juridica\n"
      "7. Listar telefones\n"
      "8. Listar endereços\n"
      "20. Excluir PF\n"
      "21. Excluir PF\n"
      "21. Excluir endereço\n"
      "22. Excluir telefone\n"
      "23. Excluir sócio\n");

  String inputOption = stdin.readLineSync()!;
  String inputDocumento = '-1';

  switch (inputOption) {
    case '1':
      while (inputDocumento == '-1' ||
          double.tryParse(inputDocumento)?.isNaN == true) {
        // Valida entrada do campo 'CPF'
        print(
            "Informe o CPF/CNPJ ou;\n número 0 para Retornar ao menú inicial");

        inputDocumento = stdin.readLineSync()!;

        if (inputDocumento.isEmpty) {
          inputDocumento = '-1';
        } else if (inputDocumento == '0') {
          menuInicial();
        }
      }

      validarCPF(inputDocumento);

      break;
    case '5':
      break;
    default:
      menuInicial();
  }
}

void validarCPF(String cpf) {
  PessoaFisica teste = PessoaFisica("validação documento",
      firstName: "Validação",
      lastName: "CPF",
      birthDate: DateTime.now(),
      cpf: cpf);
  print("CPF Valido? ${teste.validarCPF(cpf)}");
}
