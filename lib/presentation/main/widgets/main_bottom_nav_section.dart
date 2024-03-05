import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/main_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class MainBottomNavSection extends StatelessWidget {
  const MainBottomNavSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNotifier>(builder: (context, notifier, _) {
      return BottomNavigationBar(
        currentIndex: notifier.currentPageIndex,
        backgroundColor: kAppBarColor,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSubtitleColor,
        selectedLabelStyle: const TextStyle(color: kPrimaryColor),
        unselectedLabelStyle: const TextStyle(color: kSubtitleColor),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          notifier.currentPageIndex = index;
        },
        items: [
          // Bottom Navigation Items
          for (int i = 0; i < kBottomNavItems.length; i++)
            buildMainScreenItem(
              pageIndex: i,
              currentPageIndex: notifier.currentPageIndex,
              item: kBottomNavItems[i],
            ),
        ],
      );
    });
  }

  BottomNavigationBarItem buildMainScreenItem({
    required int pageIndex,
    required int currentPageIndex,
    required Map<String, dynamic> item,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        currentPageIndex == pageIndex ? item["icon"] : item["outlined_icon"],
      ),
      label: item["text"],
    );
  }
}
