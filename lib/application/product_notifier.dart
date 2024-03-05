import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductNotifier extends ChangeNotifier {
  int _carouselIndex = 0;
  int _sizeBoxIndex = 0;

  int get carouselCurrentIndex => _carouselIndex;
  int get currentSizeBoxIndex => _sizeBoxIndex;

  set carouselCurrentIndex(int index) {
    _carouselIndex = index;
    notifyListeners();
  }

  set currentSizeBoxIndex(int index) {
    _sizeBoxIndex = index;
    notifyListeners();
  }
}
