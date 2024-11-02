import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wall_share/models/wallpaper.dart';

class WallpaperProvider with ChangeNotifier {
  bool _isLoading = false;
  Wallpaper? _wallpapers;
  dynamic _image;
  File? _imageFile;

  // getters
  bool get isLoading => _isLoading;
  Wallpaper? get wallpaper => _wallpapers;
  dynamic get image => _image;
  File? get imageFile => _imageFile;

  // clear state
  void clearState() {
    _isLoading = false;
    _image = null;
    _imageFile = null;
    _wallpapers = null;
    notifyListeners();
  }

  Future<void> setImage(XFile imagePath) async {
    _imageFile = File(imagePath.path);
    _image = imagePath.path;
    notifyListeners();
  }
}
