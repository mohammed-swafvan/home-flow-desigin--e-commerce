import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/pin_code_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app presentation widgts
import 'package:home_screen_flow/presentation/widget/bordered_button_widget.dart';
import 'package:home_screen_flow/presentation/widget/delevery_dispatch_method_widget.dart';

class PinCodeSuccess extends StatelessWidget {
  const PinCodeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PinCodeNotifier>(builder: (context, pinNotifier, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Deliver to",
                      style: TextStyle(
                        fontSize: 14,
                        color: kHintTextColor,
                      ),
                    ),

                    // -- Place And PIN Code for Delivery
                    Text(
                      "Maine inglewood - ${pinNotifier.pinCode.toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // -- PIN Code Change Button
              BorderedButtonWidget(
                text: "Change",
                onTap: () {
                  pinNotifier.clearAll();
                },
              ),
            ],
          ),

          // -- Delivery Option Items
          if (pinNotifier.showSuccessMessage)
            for (int i = 0; i < kDeliverOptionsIcons.length; i++)
              DeliveryDispatchMethodWidget(
                icon: kDeliverOptionsIcons[i],
                text: kDeliveyOptionsTitles[i],
              ),
        ],
      );
    });
  }
}
