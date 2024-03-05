import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({super.key, required this.sectionTitle});
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // -- Section Headed Title
          Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // -- Section Headed Triling
          InkWell(
            onTap: () {},
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              spacing: 4,
              runSpacing: 4,
              children: [
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kSubtitleColor,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: kSubtitleColor,
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
