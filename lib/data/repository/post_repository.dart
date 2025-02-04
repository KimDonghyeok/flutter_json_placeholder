import 'package:flutter_json_placeholder/data/model/post.dart';

import '../data_source/json_place_holder_api.dart';

abstract interface class PostRepository {
  Future<Post> getPost(int id);

  Future<List<Post>> getPosts({int? page, int? limit});
}

class PostRepositoryImpl implements PostRepository {
  final _api = JsonPlaceHolderApi();

  @override
  Future<Post> getPost(int id) async {
    final posts = await _api.getPosts();
    return posts.where((e) => e.id == id).first;
  }

  @override
  Future<List<Post>> getPosts({int? page, int? limit}) {
    // TODO: To 종현
    throw UnimplementedError();
  }
}
