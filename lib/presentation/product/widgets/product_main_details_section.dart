import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import models class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/product/widgets/only_left_products_widget.dart';
import 'package:home_screen_flow/presentation/product/widgets/product_sizes_widget.dart';

class ProductMainDetailsSection extends StatelessWidget {
  const ProductMainDetailsSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Product Brand
          Text(
            product.productBrand,
            style: const TextStyle(
              fontSize: 13,
              color: kSubtitleColor,
            ),
          ),
          kHeight04,

          // -- Product Name
          Text(
            product.productName,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          kHeight05,

          // -- Product Rating & Revoew Count
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: kStarIconBgColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    // -- Rating Icon
                    const Icon(
                      Iconsax.star1,
                      size: 16,
                      color: kAppBarColor,
                    ),
                    // -- Reviews Count
                    Text(
                      product.rating,
                      style: const TextStyle(
                        fontSize: 12,
                        color: kAppBarColor,
                      ),
                    ),
                  ],
                ),
              ),
              kWidth10,
              // -- Reviews Count of the Product
              Text(
                "${product.reviews.length.toString()} Reviews",
                style: const TextStyle(
                  fontSize: 12,
                  color: kSubtitleColor,
                ),
              ),
            ],
          ),
          kHeight08,

          // -- Product Prices and Offers
          Row(
            children: [
              // -- Product Price
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              kWidth06,
              // -- Product Old Price
              Text(
                "\$${product.oldPrice}",
                style: const TextStyle(
                  fontSize: 10,
                  color: kHintTextColor,
                  overflow: TextOverflow.ellipsis,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              kWidth06,
              // -- Product Offer
              Text(
                "${product.offer}% OFF",
                style: const TextStyle(
                  fontSize: 10,
                  color: kTopSellerBannerColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          kHeight08,

          // -- Only Left products Widget
          OnlyLeftProductsWidget(product: product),
          kHeight12,

          // -- Product Sizes Widget
          ProductSizesWidget(sizes: product.sizes),
        ],
      ),
    );
  }
}
