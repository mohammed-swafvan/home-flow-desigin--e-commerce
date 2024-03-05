import 'dart:convert';

List<DealOfTheDayModel> dealOfTheDayFromJson(String str) =>
    List<DealOfTheDayModel>.from(json.decode(str).map((e) => DealOfTheDayModel.fromJson(e)));

class DealOfTheDayModel {
  final int id;
  final String productName;
  final String image;
  final String offer;

  DealOfTheDayModel({
    required this.id,
    required this.productName,
    required this.image,
    required this.offer,
  });

  factory DealOfTheDayModel.fromJson(Map<String, dynamic> json) => DealOfTheDayModel(
        id: json["id"],
        productName: json["product_name"],
        image: json["image"],
        offer: json["offer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "image": image.codeUnits,
        "offer": offer,
      };
}
