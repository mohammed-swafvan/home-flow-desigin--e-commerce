import 'package:flutter/material.dart';
import 'package:home_screen_flow/core/constants.dart';

class FilterNotifier extends ChangeNotifier {
  int _currentItemIndex = 0;
  List<Map<String, dynamic>> filterItems = [];

  int get currentIndex => _currentItemIndex;

  set currentIndex(int index) {
    _currentItemIndex = index;
    notifyListeners();
  }

  void initializeFilters() {
    _currentItemIndex = 0;
    showFilterItems(0);
    notifyListeners();
  }

  void clearAll() {
    for (var element in kFilterBrand) {
      element["is_selected"] = false;
    }
    for (var element in kFilterSize) {
      element["is_selected"] = false;
    }
    for (var element in kFilterCategory) {
      element["is_selected"] = false;
    }
    for (var element in kFilterBundle) {
      element["is_selected"] = false;
    }
    for (var element in kFilterPriceRange) {
      element["is_selected"] = false;
    }
    for (var element in kFilterDiscount) {
      element["is_selected"] = false;
    }
    for (var element in kFilterRating) {
      element["is_selected"] = false;
    }
    for (var element in kFilterPattern) {
      element["is_selected"] = false;
    }
    for (var element in kFilterSleeveLength) {
      element["is_selected"] = false;
    }
    for (var element in kFilterFit) {
      element["is_selected"] = false;
    }
    _currentItemIndex = 0;
    showFilterItems(0);
  }

  void showFilterItems(int index) {
    filterItems = [];
    notifyListeners();
    switch (index) {
      case 0:
        filterItems = kFilterBrand;
        break;
      case 1:
        filterItems = kFilterSize;
        break;
      case 2:
        filterItems = kFilterCategory;
        break;
      case 3:
        filterItems = kFilterBundle;
        break;
      case 4:
        filterItems = kFilterPriceRange;
        break;
      case 5:
        filterItems = kFilterDiscount;
        break;
      case 6:
        filterItems = kFilterRating;
        break;
      case 7:
        filterItems = kFilterPattern;
        break;
      case 8:
        filterItems = kFilterSleeveLength;
        break;
      case 9:
        filterItems = [];
        break;
      case 10:
        filterItems = kFilterFit;
        break;
    }
    notifyListeners();
  }

  void selectItem(int index) {
    switch (_currentItemIndex) {
      case 0:
        kFilterBrand[index]["is_selected"] = !kFilterBrand[index]["is_selected"];
        break;
      case 1:
        kFilterSize[index]["is_selected"] = !kFilterSize[index]["is_selected"];
        break;
      case 2:
        kFilterCategory[index]["is_selected"] = !kFilterCategory[index]["is_selected"];
        break;
      case 3:
        kFilterBundle[index]["is_selected"] = !kFilterBundle[index]["is_selected"];
        break;
      case 4:
        kFilterPriceRange[index]["is_selected"] = !kFilterPriceRange[index]["is_selected"];
        break;
      case 5:
        kFilterDiscount[index]["is_selected"] = !kFilterDiscount[index]["is_selected"];
        break;
      case 6:
        kFilterRating[index]["is_selected"] = !kFilterRating[index]["is_selected"];
        break;
      case 7:
        kFilterPattern[index]["is_selected"] = !kFilterPattern[index]["is_selected"];
        break;
      case 8:
        kFilterSleeveLength[index]["is_selected"] = !kFilterSleeveLength[index]["is_selected"];
        break;
      case 10:
        kFilterFit[index]["is_selected"] = !kFilterFit[index]["is_selected"];
        break;
    }
    notifyListeners();
  }
}
