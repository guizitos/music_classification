import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/album.dart';
import '../widgets/album_card.dart';
import '../widgets/album_tile.dart';
import 'album_detail_screen.dart';

class AlbumListScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const AlbumListScreen({super.key, required this.onToggleTheme});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  bool _isGridMode = true;
  List<Album> albuns = [];
  List<Album> albunsFiltrados = [];
  final TextEditingController _searchController = TextEditingController();

  // Controllers de scroll separados para grid e list
  final ScrollController _gridController = ScrollController();
  final ScrollController _listController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadAlbuns();
    _searchController.addListener(() {
      _filtrarAlbuns(_searchController.text);
    });
  }

  Future<void> _loadAlbuns() async {
    final String response = await rootBundle.loadString('assets/albuns.json');
    final List data = jsonDecode(response);
    setState(() {
      albuns = data.map((json) => Album.fromJson(json)).toList();
      albunsFiltrados = albuns;
    });
  }

  void _filtrarAlbuns(String query) {
    setState(() {
      albunsFiltrados = query.isEmpty
          ? albuns
          : albuns
              .where((album) =>
                  album.titulo.toLowerCase().contains(query.toLowerCase()) ||
                  album.artista.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classificação de Álbuns'),
        actions: [
          IconButton(
            icon: Icon(_isGridMode ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _isGridMode = !_isGridMode),
          ),
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por nome ou artista...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: albunsFiltrados.isEmpty
                  ? const Center(
                      key: ValueKey("empty"),
                      child: Text("Nenhum álbum encontrado"),
                    )
                  : _isGridMode
                      ? GridView.builder(
                          key: const PageStorageKey('grid_view'),
                          controller: _gridController,
                          padding: const EdgeInsets.all(8),
                          itemCount: albunsFiltrados.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (_, index) {
                            final album = albunsFiltrados[index];
                            return AlbumCard(
                              key: ValueKey('album_grid_${album.id}'),
                              album: album,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 700),
                                    pageBuilder: (_, anim1, __) => FadeTransition(
                                      opacity: anim1,
                                      child: AlbumDetailScreen(album: album),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : ListView.builder(
                          key: const PageStorageKey('list_view'),
                          controller: _listController,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: albunsFiltrados.length,
                          itemBuilder: (_, index) {
                            final album = albunsFiltrados[index];
                            return AlbumTile(
                              key: ValueKey('album_list_${album.id}'),
                              album: album,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 700),
                                    pageBuilder: (_, anim1, __) => FadeTransition(
                                      opacity: anim1,
                                      child: AlbumDetailScreen(album: album),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
