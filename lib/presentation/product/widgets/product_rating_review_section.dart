import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';
import 'package:home_screen_flow/presentation/rate_now/rate_now_screen.dart';
import 'package:home_screen_flow/presentation/utils/bottom_sheet_utils.dart';

// -- Import app presentaion widgets
import 'package:home_screen_flow/presentation/widget/bordered_button_widget.dart';
import 'package:home_screen_flow/presentation/widget/review_card_widget.dart';
import 'package:home_screen_flow/presentation/widget/section_view_more_widget.dart';
import 'package:home_screen_flow/presentation/widget/review_empty_card_widget.dart';

class ProductRatingReviewSection extends StatelessWidget {
  const ProductRatingReviewSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final List<ReviewModel> reviews = product.reviews;
    return Container(
      margin: kPaddingAll16,
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: kBorderRadius10,
        boxShadow: kCardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Section Title
          const Padding(
            padding: kPaddingHoriz16,
            child: Text(
              "Ratings & Reviews",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          kHeight12,

          // -- Divider
          if (reviews.isNotEmpty)
            Divider(
              color: kHintTextColor.withOpacity(0.2),
            ),

          if (reviews.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // -- Product Rating Count
                  Text(
                    product.rating,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "/5",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: kSubtitleColor,
                    ),
                  ),
                  kWidth10,

                  // -- Product Overall Rating Count
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Overall Rating",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${product.overallRating} Ratings",
                          style: const TextStyle(
                            fontSize: 14,
                            color: kSubtitleColor,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // -- Rate Button
                  BorderedButtonWidget(
                    text: "Rate",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RateNowScreen(product: product),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

          // -- Divider
          Divider(
            color: kHintTextColor.withOpacity(0.2),
          ),

          // -- Review Section
          if (reviews.isNotEmpty)
            ReviewCardWidget(
              review: reviews[0],
            ),

          if (reviews.isEmpty)
            ReviewEmptyCardWidget(
              onButtonTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RateNowScreen(product: product),
                  ),
                );
              },
            ),

          // Divider
          if (reviews.isNotEmpty)
            Divider(
              color: kHintTextColor.withOpacity(0.2),
            ),

          // -- Section View More Section
          if (reviews.isNotEmpty)
            SectionViewMoreWidget(
              title: "View All ${reviews.length.toString()} Reviews",
              onTap: () {
                BottomSheetUtils.productReviewBottomSheet(context, product.reviews);
              },
            ),
        ],
      ),
    );
  }
}
