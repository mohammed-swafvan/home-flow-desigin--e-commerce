import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// -- Import application provider
import 'package:home_screen_flow/application/search_notifier.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/searched_products/searched_product_screen.dart';

class SearchResultSection extends StatelessWidget {
  const SearchResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<SearchNotifier>(builder: (context, notifier, _) {
      return FutureBuilder(
        future: notifier.seachingProductsCatogories,
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Expanded(
              child: Center(
                child: Icon(
                  Icons.wifi_off_rounded,
                  color: kSubtitleColor,
                  size: 24,
                ),
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

          if (!snapshot.hasData) {
            return const Expanded(
              child: Center(
                child: Text("Search Aything..."),
              ),
            );
          }

          // -- Search Product List
          if (snapshot.data!.isNotEmpty) {
            return Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: kCardColor,
                boxShadow: kCardShadow,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String productCategory = snapshot.data![index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchedProductsScreen(
                            category: productCategory,
                          ),
                        ),
                      );
                    },
                    splashColor: Colors.black,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    titleTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    title: Text(
                      productCategory,
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              ),
            );
          }
          return const SizedBox();
        },
      );
    });
  }
}
