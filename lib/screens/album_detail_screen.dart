import 'package:flutter/material.dart';
import '../models/album.dart';
import '../widgets/classificacao_indicator.dart';

class AlbumDetailScreen extends StatelessWidget {
  final Album album;

  const AlbumDetailScreen({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(album.titulo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(album.capa, height: 180)),
            const SizedBox(height: 16),
            Text("${album.titulo} • ${album.artista}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("${album.ano} • ${album.selo}"),
            const SizedBox(height: 12),
            buildClassificacaoIndicator(album.notaMedia),
            const SizedBox(height: 16),
            const Text("Críticas:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...album.criticas.map((c) => ListTile(
                  title: Text("${c.fonte} - Nota ${c.nota}"),
                  subtitle: Text(c.comentario),
                )),
            const SizedBox(height: 16),
            const Text("Faixas:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...album.faixas.map((f) => ListTile(
                  leading: Text("${f.numero}"),
                  title: Text(f.titulo),
                  trailing: Text(f.duracao),
                )),
          ],
        ),
      ),
    );
  }
}
