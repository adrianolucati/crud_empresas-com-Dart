class Telefone {
  String ddd;
  String numero;
  String tipo;

  Telefone({required this.ddd, required this.numero, required this.tipo});

  String get telefoneFormatado {
    return '${numero.toString().substring(0, 1)} ${numero.toString().substring(1, 5)}-${numero.toString().substring(5)}';
  }
}
