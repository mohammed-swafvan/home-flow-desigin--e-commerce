import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application providers
import 'package:home_screen_flow/application/home_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import product model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/product_card_widget.dart';
import 'package:home_screen_flow/presentation/widget/section_header_widget.dart';

class HomeHotSellingSection extends StatefulWidget {
  const HomeHotSellingSection({super.key, required this.allProducts});
  final Future<List<ProductModel>> allProducts;

  @override
  State<HomeHotSellingSection> createState() => _HomeHotSellingSectionState();
}

class _HomeHotSellingSectionState extends State<HomeHotSellingSection> {
  @override
  void initState() {
    initializingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 24),
      color: kAppBarColor,
      child: Column(
        children: [
          // -- Section Header
          const SectionHeaderWidget(sectionTitle: "Hot Selling Footwear"),
          // -- Hot Selling Section Products
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: screenWidth,
            height: screenHeight / 3.4,
            child: Consumer<HomeNotifier>(builder: (context, notifier, _) {
              return FutureBuilder(
                  future: notifier.hotSellingFootWears,
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
                      return const Center(
                        child: Text("Hot Selling Foot Wears are empty"),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        ProductModel product = snapshot.data![index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: ProductCardWidget(
                              product: product,
                              imageWidth: screenWidth / 2.4,
                              badgeTitle: "Top Seller",
                              badgeColor: kTopSellerBannerColor,
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length > 4 ? 4 : snapshot.data!.length,
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }

  void initializingProducts() {
    Provider.of<HomeNotifier>(context, listen: false).getHotSellingFootWears(products: widget.allProducts);
  }
}
