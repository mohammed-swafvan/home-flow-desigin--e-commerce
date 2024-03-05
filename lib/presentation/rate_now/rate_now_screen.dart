import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

// Import application provider
import 'package:home_screen_flow/application/rate_now_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import presentation utilities
import 'package:home_screen_flow/presentation/utils/bottom_sheet_utils.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/rate_now/widgets/review_images_section.dart';
import 'package:home_screen_flow/presentation/rate_now/widgets/review_submit_button_widget.dart';
import 'package:home_screen_flow/presentation/rate_now/widgets/review_text_field_widget.dart';
import 'package:home_screen_flow/presentation/widget/header_section.dart';
import 'package:home_screen_flow/presentation/widget/rounded_image_widget.dart';

class RateNowScreen extends StatelessWidget {
  const RateNowScreen({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<RateNowNotifier>.value(
      value: Provider.of<RateNowNotifier>(context, listen: false),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Header Section
              HeaderSection(
                leadingIcon: Iconsax.arrow_left,
                title: "Write Review",
                onLeadingButton: () {
                  Navigator.of(context).pop();
                },
                actionIcons: const [],
              ),
              kHeight25,

              // -- Product Image Name Rating Bar
              Padding(
                padding: kPaddingHoriz16,
                child: Row(
                  children: [
                    // -- Product Image
                    RoundedImageWidget(
                      image: product.images[0],
                      imageWidth: screenWidth / 11,
                      imageHeight: screenWidth / 11,
                      radius: 4,
                    ),
                    kWidth10,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // -- Product Name
                          Text(
                            product.productName,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),

                          // Product Rating Bar
                          Consumer<RateNowNotifier>(
                            builder: (context, notifier, _) {
                              return RatingBar.builder(
                                itemPadding: EdgeInsets.zero,
                                itemSize: 28,
                                itemCount: 5,
                                allowHalfRating: false,
                                direction: Axis.horizontal,
                                initialRating: notifier.rating,
                                unratedColor: kHintTextColor,
                                itemBuilder: (context, _) {
                                  return const Icon(
                                    Iconsax.star1,
                                    color: kStarIconColor,
                                  );
                                },
                                onRatingUpdate: (onRating) => notifier.rating = onRating,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kHeight25,

              // -- Heading For Review Section
              Consumer<RateNowNotifier>(
                builder: (context, notifier, _) {
                  return ReviewTextFieldWidget(
                    controller: notifier.headingController,
                    label: "Heading of your review",
                    maxLine: 1,
                  );
                },
              ),
              kHeight12,

              // -- Write Review Section
              Consumer<RateNowNotifier>(
                builder: (context, notifier, _) {
                  return ReviewTextFieldWidget(
                    controller: notifier.reviewController,
                    label: "Write your review",
                    maxLine: 5,
                  );
                },
              ),
              kHeight25,

              // -- Add Review Image Section
              const ReviewImagesSection(),
              kHeight25,
              kHeight25,

              // -- Reivew Submit Button
              ReviewSubmitButtonWidget(
                text: "Submit Review",
                onTap: () {
                  BottomSheetUtils.reviewSubmitSuccessBottomSheed(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
