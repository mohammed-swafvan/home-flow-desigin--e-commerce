import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/all_products_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentatin widgets
import 'package:home_screen_flow/presentation/product/product_screen.dart';
import 'package:home_screen_flow/presentation/widget/no_result_found_widget.dart';
import 'package:home_screen_flow/presentation/widget/product_card_widget.dart';

class SearchedProductsItemsSection extends StatelessWidget {
  const SearchedProductsItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<AllProductsNotifier>(builder: (context, notifier, _) {
      return FutureBuilder(
          future: notifier.categoryProducts,
          builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
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
              return SizedBox(
                height: screenWidth * 1.4,
                child: NoResultFoundWidget(imageHeight: screenWidth / 1.4, imageWidth: screenWidth / 1.5),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "${notifier.productsLength} Items",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: kAppBarColor.withOpacity(0.5),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 16),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      mainAxisExtent: 276,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel product = snapshot.data![index];
                      double imageWidth = (screenWidth - 18 * 3) / 2;
                      // -- Product Category Items Card
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(product: product),
                            ),
                          );
                        },
                        child: ProductCardWidget(
                          product: product,
                          imageWidth: imageWidth,
                          badgeTitle: "Trending",
                          badgeColor: kTrendingBannerColor,
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                ),
              ],
            );
          });
    });
  }
}
