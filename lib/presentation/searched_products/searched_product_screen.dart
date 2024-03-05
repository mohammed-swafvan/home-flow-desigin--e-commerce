import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import application provider
import 'package:home_screen_flow/application/all_products_notifier.dart';

// -- Import product model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import services class
import 'package:home_screen_flow/infastructure/all_products/all_products_service.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/searched_products/widgets/searched_products_bottom_section.dart';
import 'package:home_screen_flow/presentation/searched_products/widgets/searched_poducts_items_section.dart';
import 'package:home_screen_flow/presentation/widget/header_section.dart';
import 'package:home_screen_flow/presentation/filter/filter_screen.dart';
import 'package:home_screen_flow/presentation/utils/bottom_sheet_utils.dart';

class SearchedProductsScreen extends StatefulWidget {
  const SearchedProductsScreen({super.key, required this.category});
  final String category;

  @override
  State<SearchedProductsScreen> createState() => _SearchedProductsScreenState();
}

class _SearchedProductsScreenState extends State<SearchedProductsScreen> {
  late Future<List<ProductModel>> allProducts;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeProducts();
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // -- Product Category Header Section
                    HeaderSection(
                      title: widget.category,
                      leadingIcon: Iconsax.arrow_left,
                      onLeadingButton: () {
                        Navigator.of(context).pop();
                      },
                      actionIcons: const [
                        {"icon": Iconsax.search_normal_1, "notification": false},
                        {"icon": Iconsax.bag_2, "notification": false},
                      ],
                    ),

                    // -- Product Category Items Section
                    const SearchedProductsItemsSection(),
                  ],
                ),
              ),
            ),

            // -- Product Category Bottom Section
            Consumer<AllProductsNotifier>(builder: (context, notifier, _) {
              if (notifier.productsLength == 0) {
                return const SizedBox();
              }
              return SearchedProductsBottomSection(
                onSortButtonTap: () {
                  BottomSheetUtils.mainBottomSheet(
                    context,
                    "SortBy",
                    ksortByFilterItems,
                  );
                },
                onFilterButtonTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FilterScreen(),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  initializeProducts() async {
    allProducts = AllProductsService().getAllProducts();
    Provider.of<AllProductsNotifier>(context, listen: false).getAllCatogryProducts(
      widget.category,
      allProducts,
    );
  }
}
