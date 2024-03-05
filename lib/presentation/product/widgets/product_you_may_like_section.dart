import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/all_products_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import application product service
import 'package:home_screen_flow/infastructure/all_products/all_products_service.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/product_card_widget.dart';
import 'package:home_screen_flow/presentation/widget/section_header_widget.dart';

class ProductYouMayLikeSection extends StatefulWidget {
  const ProductYouMayLikeSection({super.key});

  @override
  State<ProductYouMayLikeSection> createState() => _ProductYouMayLikeSectionState();
}

class _ProductYouMayLikeSectionState extends State<ProductYouMayLikeSection> {
  late Future<List<ProductModel>> allProducts;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialization();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screeWidth,
      padding: kPaddingVert16,
      decoration: const BoxDecoration(
        color: kCardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Section Header
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: SectionHeaderWidget(sectionTitle: "You may like"),
          ),

          // -- Product Items
          SizedBox(
            height: screeWidth / 1.5,
            width: screeWidth,
            child: Consumer<AllProductsNotifier>(builder: (context, notifier, _) {
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
                      return const Center(
                        child: Text(
                          "You may like is not availavel",
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      shrinkWrap: true,
                      itemCount: notifier.productsLength > 4 ? 4 : notifier.productsLength,
                      itemBuilder: (context, index) {
                        ProductModel product = snapshot.data![index];
                        return Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: InkWell(
                            onTap: () {},
                            child: ProductCardWidget(
                              product: product,
                              imageWidth: screeWidth / 2.5,
                            ),
                          ),
                        );
                      },
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }

  initialization() {
    allProducts = AllProductsService().getAllProducts();
    Provider.of<AllProductsNotifier>(context, listen: false).getAllCatogryProducts("Men's Shirt", allProducts);
  }
}
