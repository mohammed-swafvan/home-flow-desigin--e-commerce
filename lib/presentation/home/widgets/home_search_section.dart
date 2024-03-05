import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: kBorderRadius12,
            border: Border.all(
              color: kSubtitleColor,
            )),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.search_normal_1,
              size: 28,
              color: Colors.black,
            ),
            kWidth10,
            Text(
              "Search Anything...",
              style: TextStyle(
                color: kHintTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
