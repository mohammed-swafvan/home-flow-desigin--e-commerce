import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/product_images_notifier.dart';

// -- Import app presentaion widgets
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

class ProductImagesBottomSection extends StatelessWidget {
  const ProductImagesBottomSection({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth / 4,
      width: screenWidth,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<ProductImagesNotifier>(builder: (context, notifier, _) {
                  return InkWell(
                    onTap: () => notifier.currentImageIndex = index,
                    child: RoundedImageWidget(
                      image: images[index],
                      imageWidth: screenWidth / 6,
                      imageHeight: screenWidth / 6,
                      radius: 4,
                    ),
                  );
                }),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
