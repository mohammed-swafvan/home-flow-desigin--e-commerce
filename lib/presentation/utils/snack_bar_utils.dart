import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class SnackBarUtils {
  static mainSnackBar({required BuildContext context, required String content}) {
    return SnackBar(
      margin: kPaddingAll16,
      padding: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius4),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: kAppBarColor.withOpacity(0.5),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      content: Row(
        children: [
          const Icon(
            Iconsax.tick_circle5,
            size: 22,
            color: kAppBarColor,
          ),
          kWidth20,
          Text(
            content,
            style: const TextStyle(
              color: kAppBarColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
