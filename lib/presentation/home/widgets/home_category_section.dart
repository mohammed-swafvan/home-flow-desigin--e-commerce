import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import application providers

import 'package:home_screen_flow/application/home_notifier.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/section_header_widget.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- Section Header
          const SectionHeaderWidget(sectionTitle: "Categories"),
          // -- Categories
          Consumer<HomeNotifier>(builder: (context, notifier, _) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: kToolbarHeight * 1.5,
              width: screenWidth,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = kCategoryItems[index];
                  return Container(
                    margin: const EdgeInsets.only(left: 16, right: 5),
                    child: Column(
                      children: [
                        // -- Category Icons
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: data["color"].withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              data["img"],
                              width: 34,
                            ),
                          ),
                        ),
                        // -- Category Title
                        Text(
                          data["title"],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: kCategoryItems.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}
