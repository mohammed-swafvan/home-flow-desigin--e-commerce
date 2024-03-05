import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class ReviewTextFieldWidget extends StatelessWidget {
  const ReviewTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.maxLine,
  });

  final TextEditingController controller;
  final String label;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingHoriz16,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kBorderRadius12,
          border: Border.all(
            color: kHintTextColor,
          ),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          maxLines: maxLine,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 17,
              color: kSubtitleColor,
              fontWeight: FontWeight.w400,
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}
