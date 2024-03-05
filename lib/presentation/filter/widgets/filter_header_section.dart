import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/filter_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';


class FilterHeaderSection extends StatelessWidget {
  const FilterHeaderSection({super.key, required this.onBackButton});
  final VoidCallback onBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 40, 12, 0),
      color: kAppBarColor,
      child: Row(
        children: [
          // -- Back Button
          IconButton(
            onPressed: onBackButton,
            icon: const Icon(
              Icons.close,
              size: 26,
            ),
          ),
          // -- Title
          const Expanded(
            child: Text(
              "Filter",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // --
          Consumer<FilterNotifier>(builder: (context, notifier, _) {
            return InkWell(
              onTap: () {
                notifier.clearAll();
              },
              child: const Text(
                "CLEAR ALL",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: kSubtitleColor,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
