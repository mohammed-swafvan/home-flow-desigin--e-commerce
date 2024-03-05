import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/product_images_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/product_images/widgets/product_images_bottom_section.dart';
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

class ProductImagesScreen extends StatelessWidget {
  const ProductImagesScreen({super.key, required this.images, required this.initialIndex});
  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductImagesNotifier>(context, listen: false).currentImageIndex = initialIndex;
    });
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kAppBarColor,
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            // -- Header Section
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 26,
                  ),
                ),
              ),
            ),

            // -- Body Section
            Expanded(
              child: Consumer<ProductImagesNotifier>(builder: (context, notifier, _) {
                return Center(
                  child: RoundedImageWidget(
                    image: images[notifier.currentImageIndex],
                    imageWidth: screenWidth / 1.1,
                    imageHeight: screenWidth / 1.1,
                    radius: 4,
                  ),
                );
              }),
            ),

            // -- Bottom Section
            ProductImagesBottomSection(images: images),
          ],
        ),
      ),
    );
  }
}
