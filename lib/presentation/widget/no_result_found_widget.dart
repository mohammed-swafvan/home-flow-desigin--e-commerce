import 'package:flutter/material.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app constant image strings
import 'package:home_screen_flow/core/image_strings.dart';

class NoResultFoundWidget extends StatelessWidget {
  const NoResultFoundWidget({super.key, required this.imageHeight, required this.imageWidth});
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- No Result Found Image
          SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: Image.asset(
              ImageStrings.noResultFound,
              fit: BoxFit.cover,
            ),
          ),
          kHeight20,

          // -- No Result Found Text
          const Text(
            "No Result Found!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
