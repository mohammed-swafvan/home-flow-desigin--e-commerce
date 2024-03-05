import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import application providers
import 'package:provider/provider.dart';
import 'package:home_screen_flow/application/home_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';


class HomeBannerSection extends StatefulWidget {
  const HomeBannerSection({super.key});

  @override
  State<HomeBannerSection> createState() => _HomeBannerSectionState();
}

class _HomeBannerSectionState extends State<HomeBannerSection> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeNotifier>(context, listen: false).carousalCurrentIndex = 0;
    });
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: Consumer<HomeNotifier>(builder: (context, notifier, _) {
        return Column(
          children: [
            // -- Corousel Slider With Image
            CarouselSlider(
              items: kBanners.map((image) => buildImage(screenWidth: screenWidth, image: image)).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) => notifier.carousalCurrentIndex = index,
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
                  for (int i = 0; i < kBanners.length; i++)
                    Icon(
                      Icons.brightness_1,
                      size: 8,
                      color: notifier.carousalCurrentIndex == i ? kPrimaryColor : kHintTextColor.withOpacity(0.5),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  InkWell buildImage({required double screenWidth, required String image}) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: screenWidth,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
