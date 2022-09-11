import 'package:crud_empresas/crud_empresas.dart' as crud_empresas;
import 'package:crud_empresas/pessoafisica.dart';

void main(List<String> arguments) {
  print('Hello world: ${crud_empresas.calculate()}!');
  addPF();
}

void addPF() {
  PessoaFisica pessoa = PessoaFisica("PF",
      firstName: "Adriano",
      lastName: "Lucati",
      birthDate: DateTime.parse("1992-03-21"),
      cpf: "78901286904");

  print(
      "${pessoa.tipo}\n${pessoa.firstName}\n${pessoa.lastName}\n${pessoa.birthDate}\n${pessoa.cpf}\n${pessoa.id}\n${pessoa.dataCadastro}");
  print("Verificação: ${pessoa.validarCPF(pessoa.cpf)}");
}
