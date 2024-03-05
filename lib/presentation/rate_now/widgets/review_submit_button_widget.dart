import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class ReviewSubmitButtonWidget extends StatelessWidget {
  const ReviewSubmitButtonWidget({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.height;
    return Container(
      padding: kPaddingHoriz16,
      width: screenWidth,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius12,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: kAppBarColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
