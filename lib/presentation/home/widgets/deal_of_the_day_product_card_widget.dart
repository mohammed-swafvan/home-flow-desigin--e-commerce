import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import products model classed
import 'package:home_screen_flow/domain/deal_of_the_day/model/deal_of_the_day_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

class DealOfTheDayProductCardWidget extends StatelessWidget {
  const DealOfTheDayProductCardWidget({
    super.key,
    required this.product,
  });

  final DealOfTheDayModel product;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- Image Section
          RoundedImageWidget(
            image: product.image,
            imageWidth: screenWidth / 2.6,
            imageHeight: screenWidth / 2.6,
            radius: 8,
          ),
          kHeight05,
          // -- Product Name
          Text(
            product.productName,
            style: const TextStyle(
              fontSize: 13,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          kHeight10,
          // -- Product Offer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
            decoration: BoxDecoration(
              color: kNotificationColor,
              borderRadius: kBorderRadius4,
            ),
            child: Text(
              "${product.offer} OFF",
              style: const TextStyle(
                color: kAppBarColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
