import 'package:flutter/material.dart';
import 'package:home_screen_flow/domain/product/model/product_model.dart';

class HomeNotifier extends ChangeNotifier {
  int _carousalCurrentIndex = 0;
  Future<List<ProductModel>> hotSellingFootWears = Future.value([]);
  Future<List<ProductModel>> recommendedForYou = Future.value([]);

  int get carousalCurrentIndex => _carousalCurrentIndex;

  set carousalCurrentIndex(int index) {
    _carousalCurrentIndex = index;
    notifyListeners();
  }

  getHotSellingFootWears({required Future<List<ProductModel>> products}) async {
    hotSellingFootWears = Future.value([]);
    products.then((List<ProductModel> productList) {
      hotSellingFootWears = Future.value(
        productList.where((product) => product.productType == "hot selling footwear").toList(),
      );
      notifyListeners();
    });
  }

  getAllRecommendedProducts({required Future<List<ProductModel>> products}) async {
    recommendedForYou = Future.value([]);
    products.then((List<ProductModel> productList) {
      recommendedForYou = Future.value(
        productList.where((product) => product.productType == "recommended for you").toList(),
      );
      notifyListeners();
    });
  }
}
