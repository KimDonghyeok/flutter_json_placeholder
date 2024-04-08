import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder/presentation/photo_detail/photo_detail_screen.dart';
import 'package:flutter_json_placeholder/presentation/photo_list/photo_list_view_model.dart';

class PhotoListScreen extends StatefulWidget {
  final int albumId;
  final PhotoListViewModel photoListViewModel;

  const PhotoListScreen({
    super.key,
    required this.albumId,
    required this.photoListViewModel,
  });

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  void _updateUI() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.photoListViewModel.addListener(_updateUI);

    widget.photoListViewModel.getPhotoListByAlbumId(widget.albumId);
  }

  @override
  void dispose() {
    widget.photoListViewModel.removeListener(_updateUI);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoListViewModel = widget.photoListViewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List'),
      ),
      body: photoListViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              children: photoListViewModel.photoList
                  .map((photo) => GestureDetector(
                        onTap: () {
                          // context.push('/photo_detail', extra: photo);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PhotoDetailScreen(photo: photo),
                            ),
                          );
                        },
                        child: Hero(
                          tag: photo.id,
                          child: Image.network(
                            photo.thumbnailUrl,
                            errorBuilder: (context, error, stackTrace) {
                              return const Placeholder();
                            },
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
