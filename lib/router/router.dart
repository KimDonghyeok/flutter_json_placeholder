import 'package:flutter_json_placeholder/data/data_source/json_place_holder_api.dart';
import 'package:flutter_json_placeholder/data/model/photo.dart';
import 'package:flutter_json_placeholder/data/repository/album_repository.dart';
import 'package:flutter_json_placeholder/data/repository/photo_repository.dart';
import 'package:flutter_json_placeholder/presentation/album_list/album_list_screen.dart';
import 'package:flutter_json_placeholder/presentation/photo_detail/photo_detail_screen.dart';
import 'package:flutter_json_placeholder/presentation/photo_list/photo_list_screen.dart';
import 'package:flutter_json_placeholder/presentation/photo_list/photo_list_view_model.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/albums',
  routes: [
    GoRoute(
      path: '/albums',
      builder: (context, state) {
        return AlbumListScreen(
            albumRepository: AlbumRepositoryImpl(JsonPlaceHolderApi()));
      },
    ),
    GoRoute(
      path: '/photos',
      builder: (context, state) {
        int albumId = int.parse(state.uri.queryParameters['albumId']!);
        return PhotoListScreen(
          albumId: albumId,
          photoListViewModel:
              PhotoListViewModel(photoRepository: PhotoRepositoryImpl()),
        );
      },
    ),
    GoRoute(
      path: '/photo_detail',
      builder: (context, state) {
        final photo = state.extra as Photo;
        return PhotoDetailScreen(photo: photo);
      },
    ),
  ],
);
