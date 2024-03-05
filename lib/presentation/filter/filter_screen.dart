import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/filter_notifier.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/filter/widgets/filter_body_section.dart';
import 'package:home_screen_flow/presentation/widget/bottom_bottons_widget.dart';
import 'package:home_screen_flow/presentation/filter/widgets/filter_header_section.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialization();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            // -- Header Section
            FilterHeaderSection(
              onBackButton: () {
                Navigator.of(context).pop();
              },
            ),

            // -- Body Section
            const FilterBodySection(),

            // -- Bottom Bottons Section
            Consumer<FilterNotifier>(builder: (context, notifier, _) {
              return BottomBottonsWidget(
                firstButtonText: "Clear All",
                secondButtonText: "View 12 Results",
                firstButtonOnTap: () {
                  notifier.clearAll();
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  initialization() {
    Provider.of<FilterNotifier>(context, listen: false).initializeFilters();
  }
}
