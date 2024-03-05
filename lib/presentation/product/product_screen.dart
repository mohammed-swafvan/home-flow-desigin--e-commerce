import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/wished_notifier.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentation utils
import 'package:home_screen_flow/presentation/utils/snack_bar_utils.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/product/widgets/product_delivery_options_section.dart';
import 'package:home_screen_flow/presentation/product/widgets/product_details_section.dart';
import 'package:home_screen_flow/presentation/product/widgets/product_main_details_section.dart';
import 'package:home_screen_flow/presentation/product/widgets/product_rating_review_section.dart';
import 'package:home_screen_flow/presentation/product_images/product_images_sceen.dart';
import 'package:home_screen_flow/presentation/product/widgets/slider_image_section.dart';
import 'package:home_screen_flow/presentation/widget/bottom_bottons_widget.dart';
import 'package:home_screen_flow/presentation/widget/header_section.dart';
import 'package:home_screen_flow/presentation/product/widgets/product_you_may_like_section.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // -- Header Section
                    Consumer<WishedNotifier>(builder: (context, wishedNotifier, _) {
                      return HeaderSection(
                        isProductScreen: true,
                        product: product,
                        leadingIcon: Iconsax.arrow_left,
                        onLeadingButton: () {
                          Navigator.of(context).pop();
                        },
                        actionIcons: [
                          {
                            "icon": wishedNotifier.wishedIds.contains(product.id) ? Iconsax.heart5 : Iconsax.heart,
                            "notification": false,
                          },
                          const {"icon": Icons.share_outlined, "notification": false},
                          const {"icon": Iconsax.bag_2, "notification": true},
                        ],
                      );
                    }),

                    // -- Slider Image Section
                    SliderImageSection(
                      images: product.images,
                      imageOnTap: (int imageIndex) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductImagesScreen(
                              images: product.images,
                              initialIndex: imageIndex,
                            ),
                          ),
                        );
                      },
                    ),

                    // -- Product Main Details Section
                    ProductMainDetailsSection(product: product),

                    // -- Product Delivery Options Section
                    const ProductDeliveryOptionsSection(),

                    // -- Product Details Section
                    ProductDetailsSection(product: product),

                    // -- Product Rating & Review Section
                    ProductRatingReviewSection(product: product),

                    // -- Product You May Like Section
                    const ProductYouMayLikeSection(),
                  ],
                ),
              ),
            ),
            // -- Bottom Bottons Section
            BottomBottonsWidget(
              firstButtonText: "Add to Cart",
              secondButtonText: "Buy Now",
              firstButtonOnTap: () {
                SnackBar snackBar = SnackBarUtils.mainSnackBar(context: context, content: "Item Added To Cart");
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              secondButtonOnTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
