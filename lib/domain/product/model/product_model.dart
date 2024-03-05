import 'dart:convert';

List<ProductModel> allProductsFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((e) => ProductModel.fromJson(e)));

class ProductModel {
  final int id;
  final List<String> images;
  final String productName;
  final String productDescription;
  final String productBrand;
  final String productCategory;
  final String productType;
  final Map<String, dynamic> specifications;
  final String color;
  final List<String> onlyLeft;
  final bool productBadge;
  final String price;
  final String oldPrice;
  final String offer;
  final String rating;
  final String overallRating;
  final List<ReviewModel> reviews;
  final List<Map<String, dynamic>> sizes;

  ProductModel({
    required this.id,
    required this.images,
    required this.productName,
    required this.productBrand,
    required this.productDescription,
    required this.productCategory,
    required this.productType,
    required this.specifications,
    required this.color,
    required this.onlyLeft,
    required this.productBadge,
    required this.price,
    required this.oldPrice,
    required this.offer,
    required this.rating,
    required this.overallRating,
    required this.reviews,
    required this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] as int,
        images: List<String>.from(json["images"].map((x) => x)),
        productName: json["product_name"],
        productBrand: json["product_brand"],
        productDescription: json["product_description"],
        productCategory: json["product_category"],
        productType: json["product_type"],
        specifications: json["specifications"] as Map<String, dynamic>,
        color: json["color"],
        onlyLeft: List<String>.from(json["only_left"].map((x) => x)),
        productBadge: json["product_badge"],
        price: json["price"],
        oldPrice: json["old_price"],
        offer: json["offer"],
        rating: json["rating"],
        overallRating: json["overall_rating"],
        reviews: List<ReviewModel>.from(json["review"].map((x) => ReviewModel.fromJson(x))),
        sizes: List<Map<String, dynamic>>.from(json["sizes"].map((x) => x)),
      );
}

class ReviewModel {
  final String reviewSendBy;
  final String reviewDate;
  final String reviewHeading;
  final String reviewDescription;
  final double reviewRating;
  final List<String> reviewImages;

  ReviewModel({
    required this.reviewSendBy,
    required this.reviewDate,
    required this.reviewDescription,
    required this.reviewHeading,
    required this.reviewRating,
    required this.reviewImages,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewSendBy: json["review_send_by"] as String,
      reviewDate: json["review_date"] as String,
      reviewDescription: json["review_description"] as String,
      reviewHeading: json["review_heading"] as String,
      reviewRating: (json["review_rating"] as int).toDouble(),
      reviewImages: List<String>.from(json["review_images"].map((x) => x as String)),
    );
  }
}
