class Critica {
  final String fonte;
  final int nota;
  final String comentario;

  Critica({required this.fonte, required this.nota, required this.comentario});

  factory Critica.fromJson(Map<String, dynamic> json) {
    return Critica(
      fonte: json['fonte'],
      nota: json['nota'],
      comentario: json['comentario'],
    );
  }
}
