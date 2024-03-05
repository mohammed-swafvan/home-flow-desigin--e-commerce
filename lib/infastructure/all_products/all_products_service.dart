import 'package:home_screen_flow/domain/product/model/product_model.dart';
import 'package:flutter/services.dart' as the_bundle;

class AllProductsService {
  // -- Getting all Products
  Future<List<ProductModel>> getAllProducts() async {
    final data = await the_bundle.rootBundle.loadString("assets/json/all-products.json");
    List<ProductModel> products = allProductsFromJson(data);
    return products;
  }
}
