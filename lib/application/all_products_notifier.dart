import 'package:flutter/material.dart';
import 'package:home_screen_flow/domain/product/model/product_model.dart';

class AllProductsNotifier extends ChangeNotifier {
  Future<List<ProductModel>> categoryProducts = Future.value([]);
  int productsLength = 0;

  Future<void> getAllCatogryProducts(String category, Future<List<ProductModel>> allProducts) async {
    categoryProducts = Future.value([]);
    productsLength = 0;
    notifyListeners();
    if (category == "Men's Shoes") return;
    categoryProducts = allProducts.then((List<ProductModel> products) {
      return Future.value(
        products
            .where((element) {
              return element.productCategory.toLowerCase() == category.toLowerCase();
            })
            .toList()
            .reversed
            .toList(),
      );
    }).catchError((error) {
      return categoryProducts = Future.error(error);
    });

    categoryProducts.then((List<ProductModel> categoryProductsList) {
      productsLength = categoryProductsList.length;
      notifyListeners();
    });
  }
}
