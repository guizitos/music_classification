import 'critica.dart';
import 'faixa.dart';

class Album {
  final int id;
  final String titulo;
  final String artista;
  final String capa;
  final int ano;
  final double notaMedia;
  final List<Critica> criticas;
  final List<Faixa> faixas;
  final List<String> generos;
  final String selo;

  Album({
    required this.id,
    required this.titulo,
    required this.artista,
    required this.capa,
    required this.ano,
    required this.notaMedia,
    required this.criticas,
    required this.faixas,
    required this.generos,
    required this.selo,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      titulo: json['titulo'],
      artista: json['artista'],
      capa: json['capa'],
      ano: json['ano'],
      notaMedia: (json['notaMedia'] as num).toDouble(),
      criticas: (json['criticas'] as List)
          .map((c) => Critica.fromJson(c))
          .toList(),
      faixas: (json['faixas'] as List).map((f) => Faixa.fromJson(f)).toList(),
      generos: List<String>.from(json['generos']),
      selo: json['selo'],
    );
  }
}
