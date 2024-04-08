import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder/data/model/photo.dart';
import 'package:flutter_json_placeholder/data/repository/photo_repository.dart';

class PhotoListViewModel with ChangeNotifier {
  final PhotoRepository photoRepository;
  List<Photo> _photoList = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<Photo> get photoList => _photoList;

  PhotoListViewModel({
    required this.photoRepository,
  });

  void changeLoadingStatus(bool status) {
    _isLoading = status;
  }

  void getPhotoListByAlbumId(int albumId) async {
    _photoList = await photoRepository.getPhotos(albumId);
    changeLoadingStatus(false);
    notifyListeners();
  }
}
