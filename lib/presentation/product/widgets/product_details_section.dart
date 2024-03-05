import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/utils/bottom_sheet_utils.dart';
import 'package:home_screen_flow/presentation/widget/section_view_more_widget.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final productDetails = product.specifications;
    int productDetailsLenght = productDetails.length > 4 ? 4 : productDetails.length;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 16),
      width: screenWidth,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: kBorderRadius10,
        boxShadow: kCardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Product Details Section Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Product Details",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          kHeight12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // -- Produt Details Title
                SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < productDetailsLenght; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "• ${mapKey(productDetails, i)}",
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
                      for (int i = 0; i < productDetailsLenght; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6).copyWith(left: 8),
                          child: Text(
                            "-  ${mapValue(productDetails, i)}",
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
          ),
          kHeight20,
          Divider(
            color: kHintTextColor.withOpacity(0.2),
          ),
          SectionViewMoreWidget(
            title: "View More",
            onTap: () {
              BottomSheetUtils.productDetailsBottomSheet(context, product);
            },
          ),
        ],
      ),
    );
  }

  String mapKey(Map<String, dynamic> productDetails, int index) {
    String key = productDetails.keys.elementAt(index);
    return key;
  }

  String mapValue(Map<String, dynamic> productDetails, int index) {
    final String key = productDetails.keys.elementAt(index);
    final String value = productDetails[key].toString();
    return value;
  }
}
