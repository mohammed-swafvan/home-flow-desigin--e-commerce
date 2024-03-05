import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app presentation widget
import 'package:home_screen_flow/presentation/widget/bordered_button_widget.dart';

class ReviewEmptyCardWidget extends StatelessWidget {
  const ReviewEmptyCardWidget({super.key, required this.onButtonTap});
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).copyWith(bottom: 14),
      child: Row(
        children: [
          const Icon(
            Iconsax.star_1,
            color: Colors.black,
            size: 22,
          ),
          kWidth08,
          const Expanded(
            child: Text(
              "You are the first to add rating.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          kWidth08,
          BorderedButtonWidget(
            text: "Rate Now",
            onTap: onButtonTap,
          ),
        ],
      ),
    );
  }
}
