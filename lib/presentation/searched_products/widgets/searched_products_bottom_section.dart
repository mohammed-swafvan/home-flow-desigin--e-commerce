import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

class SearchedProductsBottomSection extends StatelessWidget {
  const SearchedProductsBottomSection({
    super.key,
    required this.onSortButtonTap,
    required this.onFilterButtonTap,
  });

  final VoidCallback onSortButtonTap;
  final VoidCallback onFilterButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: kAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // -- Filter Button
          InkWell(
            onTap: onFilterButtonTap,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Iconsax.setting_4,
                  size: 28,
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // -- Sort Button
          InkWell(
            onTap: onSortButtonTap,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Iconsax.sort,
                  size: 28,
                ),
                Text(
                  "Sort By",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
