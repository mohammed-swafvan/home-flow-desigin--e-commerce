import 'package:flutter/material.dart';
import 'package:home_screen_flow/domain/product/model/product_model.dart';

class SearchNotifier extends ChangeNotifier {
  Future<List<String>> allProductsCategories = Future.value([]);
  Future<List<String>> seachingProductsCatogories = Future.value([]);
  TextEditingController searchController = TextEditingController();

  clearSearchController() {
    searchController.clear();
    seachingProductsCatogories = Future.value([]);
    notifyListeners();
  }

  Future<void> initializeProductsCategories(Future<List<ProductModel>> products) async {
    allProductsCategories = Future.value([]);
    allProductsCategories = products.then((List<ProductModel> products) {
      return products.map((e) => e.productCategory).toSet().toList();
    });
    notifyListeners();
  }

  Future<void> runFilter() async {
    seachingProductsCatogories = Future.value([]);
    String searchValue = searchController.text;
    if (searchValue.isEmpty) {
      seachingProductsCatogories = Future.value([]);
    } else {
      allProductsCategories.then((List<String> productCategories) {
        List<String> filteredProductsCategory = productCategories.where((element) {
          return element.toLowerCase().startsWith(searchValue.toLowerCase());
        }).toList();

        seachingProductsCatogories = Future.value(filteredProductsCategory.toList());
      });
    }
    notifyListeners();
  }
}
