import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RateNowNotifier extends ChangeNotifier {
  TextEditingController headingController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  double _rating = 0;
  List<String> _reivewImages = [];

  double get rating => _rating;
  List<String> get reviewImages => _reivewImages;

  set rating(double value) {
    _rating = value;
    notifyListeners();
  }

  set reviewImages(List<String> value) {
    if (_reivewImages.length < 4) {
      _reivewImages = value;
      notifyListeners();
    }
  }

  initialization() {
    headingController.clear();
    reviewController.clear();
    _rating = 0;
    _reivewImages = [];
    notifyListeners();
  }
}
