import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/product_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class ProductSizesWidget extends StatelessWidget {
  const ProductSizesWidget({super.key, required this.sizes});
  final List<Map<String, dynamic>> sizes;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // -- Product Sizes Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Size",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "Size Chart",
                style: TextStyle(
                  fontSize: 13,
                  color: kSubtitleColor,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: kSubtitleColor,
                ),
              ),
            ),
          ],
        ),
        kHeight10,

        // -- Product Sizes
        SizedBox(
          height: screenWidth / 10.5,
          width: screenWidth,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> size = sizes[index];
              return Consumer<ProductNotifier>(builder: (context, notifier, _) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: !size["out_of_stock"]
                        ? () {
                            notifier.currentSizeBoxIndex = index;
                          }
                        : null,
                    child: Container(
                      height: screenWidth / 10.5,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: boxDecoration(
                        size["out_of_stock"],
                        notifier.currentSizeBoxIndex == index,
                      ),
                      child: Center(
                        child: Text(
                          size["size"],
                          style: TextStyle(
                            color: size["out_of_stock"]
                                ? kHintTextColor
                                : notifier.currentSizeBoxIndex == index
                                    ? kAppBarColor
                                    : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }

  BoxDecoration boxDecoration(bool outOfStck, bool isSelected) {
    if (outOfStck) {
      return BoxDecoration(
        color: kScaffoldBgColor,
        borderRadius: kBorderRadius6,
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
      );
    }
    if (isSelected) {
      return BoxDecoration(
        color: kPrimaryColor,
        borderRadius: kBorderRadius6,
      );
    }
    return BoxDecoration(
      color: kAppBarColor.withOpacity(0.4),
      borderRadius: kBorderRadius6,
      border: Border.all(
        color: kHintTextColor,
      ),
    );
  }
}
