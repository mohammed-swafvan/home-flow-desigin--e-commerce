import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';
import 'package:home_screen_flow/presentation/widget/review_card_widget.dart';

// -- Import presentation widgets
import 'package:home_screen_flow/presentation/rate_now/widgets/review_submit_button_widget.dart';

class BottomSheetUtils {
  // -- Commont Bottom Sheet
  static Future<dynamic> mainBottomSheet(BuildContext context, String title, List<String> items) {
    return showModalBottomSheet(
      backgroundColor: kAppBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 26,
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < items.length; i++)
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      items[i],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // -- Product Details Bottom Sheet
  static Future<dynamic> productDetailsBottomSheet(BuildContext context, ProductModel product) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String mapKey(Map<String, dynamic> productDetails, int index) {
      String key = productDetails.keys.elementAt(index);
      return key;
    }

    String mapValue(Map<String, dynamic> productDetails, int index) {
      final String key = productDetails.keys.elementAt(index);
      final String value = productDetails[key].toString();
      return value;
    }

    return showModalBottomSheet(
      backgroundColor: kAppBarColor,
      scrollControlDisabledMaxHeightRatio: screenHeight * 0.75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: screenHeight * 0.75,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      product.productDescription,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kSubtitleColor,
                      ),
                    ),
                  ),
                  kHeight05,
                  const Text(
                    "Specification",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  kHeight05,
                  Row(
                    children: [
                      // -- Produt Details Title
                      SizedBox(
                        width: screenWidth / 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < product.specifications.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  mapKey(product.specifications, i),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: kSubtitleColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      // -- Product Details Type
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < product.specifications.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6).copyWith(left: 8),
                                child: Text(
                                  mapValue(product.specifications, i),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // -- Product Details Bottom Sheet
  static Future<dynamic> productReviewBottomSheet(BuildContext context, List<ReviewModel> reviews) {
    final screenHeight = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
      context: context,
      backgroundColor: kCardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      scrollControlDisabledMaxHeightRatio: screenHeight * 0.95,
      builder: (contex) {
        return Container(
          height: screenHeight * 0.95,
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // -- Section Headed Title
                  const Text(
                    "Rating & Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // -- Section Headed Triling
                  IconButton(
                    onPressed: () {
                      Navigator.of(contex).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 24,
                    ),
                  )
                ],
              ),
              Container(
                padding: kPaddingVert16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(contex).pop();
                        mainBottomSheet(
                          context,
                          "Sort By",
                          kReviewSortBy,
                        );
                      },
                      child: const Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          Icon(
                            Iconsax.sort,
                            size: 24,
                          ),
                          Text(
                            "Sort By",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 14,
                      color: kHintTextColor,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(contex).pop();
                        mainBottomSheet(
                          context,
                          "Filter",
                          kReviewFilter,
                        );
                      },
                      child: const Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          Icon(
                            Iconsax.setting_4,
                            size: 24,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: kHintTextColor.withOpacity(0.2),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    ReviewModel review = reviews[index];
                    return ReviewCardWidget(review: review);
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: kHintTextColor.withOpacity(0.2),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // -- Review Submit Succes Bottom Sheet
  static Future<dynamic> reviewSubmitSuccessBottomSheed(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      context: context,
      backgroundColor: kCardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      scrollControlDisabledMaxHeightRatio: screenHeight * 0.45,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          height: screenHeight * 0.45,
          width: screenWidth,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.tick_circle,
                  size: screenWidth / 3.5,
                  color: kPrimaryColor,
                ),
                kHeight06,
                const Text(
                  "Review Submitted Successfully",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                ReviewSubmitButtonWidget(
                  text: "Done",
                  onTap: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
