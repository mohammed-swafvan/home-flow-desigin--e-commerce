import "package:flutter/services.dart" as the_bundle;
import "package:home_screen_flow/domain/deal_of_the_day/model/deal_of_the_day_model.dart";

class DealOfTheDayServices {
  // -- Getting for the deal of the day products
  Future<List<DealOfTheDayModel>> getAllProducts() async {
    final data = await the_bundle.rootBundle.loadString("assets/json/deal-of-the-day.json");
    List<DealOfTheDayModel> products = dealOfTheDayFromJson(data);
    return products;
  }
}
