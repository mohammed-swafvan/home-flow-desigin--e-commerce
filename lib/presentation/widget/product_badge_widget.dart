import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constant
import 'package:home_screen_flow/core/constants.dart';

class ProductBadgeWidget extends StatelessWidget {
  const ProductBadgeWidget({super.key, required this.badgeColor, required this.badgeTitle});

  final Color badgeColor;
  final String badgeTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: kBorderRadius4,
      ),
      child: Text(
        badgeTitle,
        style: const TextStyle(
          color: kAppBarColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
