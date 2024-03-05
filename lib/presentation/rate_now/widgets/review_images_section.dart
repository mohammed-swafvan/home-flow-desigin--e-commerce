import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

// -- Impoort application provider
import 'package:home_screen_flow/application/rate_now_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

class ReviewImagesSection extends StatelessWidget {
  const ReviewImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Consumer<RateNowNotifier>(builder: (context, notifier, _) {
        return SizedBox(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              InkWell(
                onTap: () {
                  List<String> addedImages = notifier.reviewImages;
                  addedImages.add("assets/images/second_shirt_1.webp");

                  notifier.reviewImages = addedImages;
                },
                child: Column(
                  children: [
                    Container(
                      width: screenWidth / 11,
                      height: screenWidth / 11,
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadius12,
                        border: Border.all(
                          color: kHintTextColor,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Iconsax.gallery_add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    kHeight04,
                    const Text(
                      "Add Photo",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),

              // -- Added Review Images

              for (var i = 0; i < notifier.reviewImages.length; i++)
                Stack(
                  children: [
                    RoundedImageWidget(
                      image: notifier.reviewImages[i],
                      imageWidth: screenWidth / 11,
                      imageHeight: screenWidth / 11,
                      radius: 8,
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: InkWell(
                        onTap: () {
                          List<String> addedImages = notifier.reviewImages;
                          addedImages.removeAt(i);

                          notifier.reviewImages = addedImages;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kAppBarColor.withOpacity(0.4),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
