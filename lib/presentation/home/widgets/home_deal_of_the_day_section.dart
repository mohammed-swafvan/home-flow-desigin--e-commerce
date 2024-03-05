import 'dart:async';

import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import products model classes
import 'package:home_screen_flow/domain/deal_of_the_day/model/deal_of_the_day_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/home/widgets/deal_of_the_day_product_card_widget.dart';
import 'package:home_screen_flow/presentation/widget/section_header_widget.dart';
import 'package:home_screen_flow/presentation/widget/time_duration_widget.dart';

class HomeDealOfTheDaySection extends StatefulWidget {
  const HomeDealOfTheDaySection({super.key, required this.products});

  final Future<List<DealOfTheDayModel>> products;

  @override
  State<HomeDealOfTheDaySection> createState() => _HomeDealOfTheDaySectionState();
}

class _HomeDealOfTheDaySectionState extends State<HomeDealOfTheDaySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          // -- Section Header
          const SectionHeaderWidget(sectionTitle: "Deal of the day"),
          kHeight05,
          // -- Time Duration
          const Align(
            alignment: Alignment.centerLeft,
            child: TimeDurationWidget(),
          ),
          // -- Deal Of The Day Products
          Card(
            margin: const EdgeInsets.all(16),
            color: kAppBarColor,
            child: FutureBuilder(
              future: widget.products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Icon(
                      Icons.wifi_off_rounded,
                      color: kSubtitleColor,
                      size: 24,
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text("Erro: ${snapshot.error}"),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("Deal Of The Day Products are empty"),
                  );
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16).copyWith(bottom: 4),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 224,
                  ),
                  itemBuilder: (context, index) {
                    final DealOfTheDayModel product = snapshot.data![index];
                    // -- Deal Of The Day Product Card
                    return DealOfTheDayProductCardWidget(
                      product: product,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
