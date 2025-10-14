import 'package:flutter/material.dart';
import '../models/album.dart';
import 'classificacao_indicator.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumTile({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // altura fixa do ListTile para evitar erros
      child: ListTile(
        key: ValueKey(album.id),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            album.capa,
            width: 50,
            height: 50,
            fit: BoxFit.cover, // garante que a imagem preencha a área
          ),
        ),
        title: Text(
          album.titulo,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "${album.artista} • ${album.ano}",
          overflow: TextOverflow.ellipsis,
        ),
        trailing: buildClassificacaoIndicator(album.notaMedia),
        onTap: onTap,
      ),
    );
  }
}
