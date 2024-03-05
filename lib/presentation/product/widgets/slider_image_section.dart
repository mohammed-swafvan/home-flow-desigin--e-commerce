import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// -- Import app constant colors

// -- Import app presentation widgets
import 'package:home_screen_flow/application/product_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

class SliderImageSection extends StatelessWidget {
  const SliderImageSection({
    super.key,
    required this.images,
    required this.imageOnTap,
  });
  final List<String> images;
  final Function(int) imageOnTap;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductNotifier>(context, listen: false).carouselCurrentIndex = 0;
    });
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<ProductNotifier>(builder: (context, notifier, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- Carousel Slider With Image
          CarouselSlider(
            items: [
              for (int i = 0; i < images.length; i++)
                InkWell(
                  onTap: () => imageOnTap(i),
                  child: buildImage(
                    screenWidth: screenWidth,
                    image: images[i],
                  ),
                ),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => notifier.carouselCurrentIndex = index,
            ),
          ),

          // -- Sliding Dots
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < images.length; i++)
                  Icon(
                    Icons.brightness_1,
                    size: 8,
                    color: notifier.carouselCurrentIndex == i ? kPrimaryColor : kHintTextColor.withOpacity(0.5),
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }

  SizedBox buildImage({required double screenWidth, required String image}) {
    return SizedBox(
      width: screenWidth,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
