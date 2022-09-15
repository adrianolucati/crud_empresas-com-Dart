import 'package:uuid/uuid.dart';

class Telefone {
  late String id;
  String ddd;
  String numero;
  String tipo;

  Telefone({required this.ddd, required this.numero, required this.tipo}) {
    id = Uuid().v1();
  }

  String get telefoneFormatado {
    return '$ddd-${numero.toString().substring(0, 1)} ${numero.toString().substring(1, 5)}-${numero.toString().substring(5)}';
  }
}
