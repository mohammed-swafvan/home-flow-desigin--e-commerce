import 'package:flutter/material.dart';

// -- Import product model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import application provider
import 'package:provider/provider.dart';
import 'package:home_screen_flow/application/search_notifier.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/search/widgets/search_header_section.dart';
import 'package:home_screen_flow/presentation/search/widgets/search_result_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.allProducts});
  final Future<List<ProductModel>> allProducts;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: const Column(
            children: [
              // -- Seach Header Section
              SearchHeaderSection(),

              // -- Search Result Section
              SearchResultSection(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initializeProducts() async {
    Provider.of<SearchNotifier>(context, listen: false).initializeProductsCategories(widget.allProducts);
  }
}
