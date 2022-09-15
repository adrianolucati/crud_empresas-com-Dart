import 'package:uuid/uuid.dart';

class Endereco {
  late String id;
  String cep = '-1';
  String titulo = '-1';
  String tipoLogradouro = '-1';
  String logradouro = '-1';
  int numero = -1;
  String bairro = '-1';
  String cidade = '-1';
  String uf = '-1';
  String pais = '-1';
  String complemento = '';

  Endereco(
      {required this.cep,
      required this.titulo,
      required this.tipoLogradouro,
      required this.logradouro,
      required this.numero,
      required this.bairro,
      required this.cidade,
      required this.uf,
      required this.pais,
      this.complemento = ''}) {
    id = Uuid().v1();
  }

  String get enderecoCompleto {
    return 'ID:  $id\nCEP: $cep - $tipoLogradouro $logradouro, $numero, $bairro, $cidade-$uf ($pais)\nComplemento: $complemento';
  }
}
