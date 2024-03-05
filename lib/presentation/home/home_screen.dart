import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

// -- Import application providers
import 'package:home_screen_flow/application/home_notifier.dart';

// -- Import products model classes
import 'package:home_screen_flow/domain/deal_of_the_day/model/deal_of_the_day_model.dart';
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app services
import 'package:home_screen_flow/infastructure/all_products/all_products_service.dart';
import 'package:home_screen_flow/infastructure/deal_of_the_day/deal_of_the_day_service.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/home/widgets/home_banner_section.dart';
import 'package:home_screen_flow/presentation/home/widgets/home_category_section.dart';
import 'package:home_screen_flow/presentation/home/widgets/home_deal_of_the_day_section.dart';
import 'package:home_screen_flow/presentation/widget/header_section.dart';
import 'package:home_screen_flow/presentation/home/widgets/home_search_section.dart';
import 'package:home_screen_flow/presentation/home/widgets/home_hot_selling_section.dart';
import 'package:home_screen_flow/presentation/home/widgets/home_recommended_section.dart';
import 'package:home_screen_flow/presentation/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onMenuButtonTap});
  final Function() onMenuButtonTap;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<DealOfTheDayModel>> dealOfTheDayProducts;
  late Future<List<ProductModel>> allProducts;

  @override
  void initState() {
    initializeProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<HomeNotifier>(builder: (context, notifier, _) {
        return Column(
          children: [
            // -- Header Section
            HeaderSection(
              onLeadingButton: widget.onMenuButtonTap,
              title: "Home",
              leadingIcon: Iconsax.menu_1,
              actionIcons: const [
                {"icon": Iconsax.notification, "notification": true},
                {"icon": Iconsax.bag_2, "notification": true},
              ],
            ),

            // -- Search Field Section
            HomeSearchSection(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(allProducts: allProducts),
                ),
              );
            }),

            // -- Category Section
            const HomeCategorySection(),

            // -- Banner Section
            const HomeBannerSection(),

            // -- Deal Of The Day Section
            HomeDealOfTheDaySection(
              products: dealOfTheDayProducts,
            ),

            // -- Hot Selling Footwear Section
            HomeHotSellingSection(
              allProducts: allProducts,
            ),

            // -- Recommended For You Section
            HomeRecommendedSection(
              allProducts: allProducts,
            ),
          ],
        );
      }),
    );
  }

  initializeProducts() async {
    dealOfTheDayProducts = DealOfTheDayServices().getAllProducts();
    allProducts = AllProductsService().getAllProducts();
  }
}
