import 'package:flutter/material.dart';
import '../models/album.dart';
import 'animations/fade_scale.dart';
import 'animations/hero_image.dart';

class AlbumCard extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumCard({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FadeScaleAnimation(
      key: ValueKey(album.id),
      index: album.id,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagem com altura fixa no Grid
              SizedBox(
                height: 150, // define altura fixa
                child: HeroImage(
                  tag: album.id.toString(),
                  imagePath: album.capa,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  fit: BoxFit.cover, // garante preenchimento da área
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  album.titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1, // evita overflow de texto
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: Text(
                  album.artista,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
