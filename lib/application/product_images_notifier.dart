import 'package:flutter/material.dart';

class ProductImagesNotifier extends ChangeNotifier {
  int _imageIndex = 0;

  int get currentImageIndex => _imageIndex;

  set currentImageIndex(int index) {
    _imageIndex = index;
    notifyListeners();
  }
}
