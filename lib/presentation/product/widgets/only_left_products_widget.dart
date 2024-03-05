import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/product_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import models class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

class OnlyLeftProductsWidget extends StatelessWidget {
  const OnlyLeftProductsWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductNotifier>(context, listen: false).currentSizeBoxIndex = 0;
    });
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            // -- Product Color
            const Text(
              "Color: ",
              style: TextStyle(
                fontSize: 14,
                color: kHintTextColor,
              ),
            ),
            Text(
              product.color,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),

            // -- Product Left Count
            Text(
              "Only ${product.onlyLeft.length} Left",
              style: const TextStyle(
                fontSize: 13,
                color: kSubtitleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        kHeight10,

        // -- Product Only Left Images
        SizedBox(
          height: screenWidth / 6,
          width: screenWidth,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: product.onlyLeft.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {},
                  child: RoundedImageWidget(
                    image: product.onlyLeft[index],
                    imageWidth: screenWidth / 6,
                    imageHeight: screenWidth / 6,
                    radius: 4,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
