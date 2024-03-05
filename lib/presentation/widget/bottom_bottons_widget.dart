import 'package:flutter/material.dart';

// -- Import app constant Colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class BottomBottonsWidget extends StatelessWidget {
  const BottomBottonsWidget({
    super.key,
    required this.firstButtonText,
    required this.secondButtonText,
    this.firstButtonOnTap,
    this.secondButtonOnTap,
  });
  final String firstButtonText;
  final String secondButtonText;
  final VoidCallback? firstButtonOnTap;
  final VoidCallback? secondButtonOnTap;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: kAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // -- First Button On The Bottom
          Expanded(
            child: SizedBox(  
              height: 48,
              child: ElevatedButton(
                onPressed: firstButtonOnTap ?? (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAppBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: kBorderRadius10,
                    side: const BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                child: Text(
                  firstButtonText,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          kWidth20,

          // -- Second Button On The Bottom
          Expanded(
            child: SizedBox(
              height: 48,
              width: screenWidth / 2.3,
              child: ElevatedButton(
                onPressed: secondButtonOnTap ?? (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: kBorderRadius12,
                  ),
                ),
                child: Text(
                  secondButtonText,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kAppBarColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
