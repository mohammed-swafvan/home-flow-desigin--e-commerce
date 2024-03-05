import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/wished_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import product model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/product_badge_widget.dart';
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

//  -- Import Iconsax package
import 'package:iconsax/iconsax.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    this.badgeTitle,
    this.badgeColor,
    this.imageWidth,
    this.imageHeigth,
  });

  final ProductModel product;
  final String? badgeTitle;
  final Color? badgeColor;
  final double? imageWidth;
  final double? imageHeigth;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initilization(context);
    });
    return SizedBox(
      width: imageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                // -- Product Image
                RoundedImageWidget(
                  image: product.images[0],
                  imageWidth: imageWidth,
                  radius: 8,
                  imageHeight: imageHeigth,
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  right: 6,
                  child: Row(
                    children: [
                      // -- Product Badge
                      if (product.productBadge && badgeColor != null && badgeTitle != null)
                        ProductBadgeWidget(
                          badgeColor: badgeColor!,
                          badgeTitle: badgeTitle!,
                        ),
                      const Spacer(),
                      // -- Wish List Icon
                      Consumer<WishedNotifier>(builder: (context, notifier, _) {
                        return InkWell(
                          onTap: () async {
                            await notifier.createWishList(product.id);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kAppBarColor.withOpacity(0.7),
                            ),
                            child: Icon(
                              notifier.wishedIds.contains(product.id) ? Iconsax.heart5 : Iconsax.heart,
                              color: notifier.wishedIds.contains(product.id) ? kNotificationColor : kSubtitleColor,
                              size: 18,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          kHeight08,
          // -- Prodect Name
          Text(
            product.productName,
            style: const TextStyle(
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
          kHeight10,
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
              kWidth04,
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
              kWidth04,
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
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              // -- Product Rating Icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2).copyWith(left: 0),
                decoration: BoxDecoration(
                  color: kStarIconBgColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Icon(
                  Iconsax.star1,
                  size: 16,
                  color: kAppBarColor,
                ),
              ),
              // -- Product Rating
              Text(
                product.rating,
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // -- Product Overall Rating
              Text(
                "(${product.overallRating})",
                style: const TextStyle(
                  fontSize: 14,
                  color: kSubtitleColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void initilization(BuildContext context) {
    Provider.of<WishedNotifier>(context, listen: false).getAllWishedListIds();
  }
}
