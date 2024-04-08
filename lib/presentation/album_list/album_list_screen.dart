import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder/data/model/album.dart';
import 'package:flutter_json_placeholder/data/repository/album_repository.dart';
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatefulWidget {
  final AlbumRepository albumRepository;

  const AlbumListScreen({super.key, required this.albumRepository});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List<Album> _albums = [];

  @override
  void initState() {
    super.initState();

    widget.albumRepository.getAlbums().then((albums) {
      setState(() {
        _albums = albums;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: _albums.map((album) {
          return ListTile(
            onTap: () {
              context.push(Uri(
                path: '/photos',
                queryParameters: {'albumId': album.id.toString()},
              ).toString());
            },
            title: Text('${album.id}: ${album.title}'),
          );
        }).toList(),
      ),
    );
  }
}
