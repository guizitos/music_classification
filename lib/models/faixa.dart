class Faixa {
  final int numero;
  final String titulo;
  final String duracao;

  Faixa({required this.numero, required this.titulo, required this.duracao});

  factory Faixa.fromJson(Map<String, dynamic> json) {
    return Faixa(
      numero: json['numero'],
      titulo: json['titulo'],
      duracao: json['duracao'],
    );
  }
}
