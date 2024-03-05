import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/filter_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class FilterBodySection extends StatelessWidget {
  const FilterBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: screenWidth / 3,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: kFilterOptions.length,
                itemBuilder: (context, index) {
                  return Consumer<FilterNotifier>(builder: (context, notifier, _) {
                    return ListTile(
                      onTap: () {
                        notifier.currentIndex = index;
                        notifier.showFilterItems(index);
                      },
                      selected: notifier.currentIndex == index,
                      selectedTileColor: kAppBarColor,
                      style: ListTileStyle.list,
                      title: Text(
                        kFilterOptions[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    );
                  });
                }),
          ),
          Expanded(
            child: Container(
              color: kAppBarColor,
              child: Consumer<FilterNotifier>(builder: (context, notifier, _) {
                if (notifier.filterItems.isEmpty) {
                  return const Center(
                    child: Text("No Items"),
                  );
                }
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: notifier.filterItems.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: notifier.filterItems[index]["is_selected"],
                            onChanged: (value) {
                              notifier.selectItem(index);
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            side: const BorderSide(
                              color: kHintTextColor,
                              width: 0.5,
                            ),
                            visualDensity: const VisualDensity(vertical: 2),
                          ),
                          Expanded(
                            child: Text(
                              notifier.filterItems[index]["item_name"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }
}
