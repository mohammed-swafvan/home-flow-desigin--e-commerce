import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/pin_code_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/widget/delevery_dispatch_method_widget.dart';

class PinCodeTextFormFieldWidget extends StatelessWidget {
  const PinCodeTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PinCodeNotifier>(builder: (context, notifier, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Delivery Options",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          kHeight12,

          // -- PIN Code Text Field
          TextFormField(
            focusNode: notifier.focusNode,
            controller: notifier.pinCodeController,
            onChanged: (value) => notifier.onUserTyping(value),
            keyboardType: TextInputType.number,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),

              // -- Suffix Button
              suffixIcon: Container(
                padding: const EdgeInsets.all(14),
                child: InkWell(
                  onTap: () {
                    if (notifier.showInvalidMessage) {
                      notifier.clearAll();
                    } else {
                      notifier.onPinCodeCheck();
                    }
                  },
                  child: Text(
                    notifier.showInvalidMessage ? "CHANGE" : "CHECK",
                    style: const TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              filled: true,
              fillColor: Colors.transparent,
              focusedBorder: getInputBorder,
              enabledBorder: getInputBorder,
              border: getInputBorder,
              hintText: "Enter PIN Code",
              hintStyle: const TextStyle(
                fontSize: 15,
                color: kHintTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          kHeight08,

          // -- Error Messages
          if (notifier.showInvalidMessage) errorText("Sorry! Currently We don't ship to this pin code"),
          if (notifier.showEnterPinMessage) errorText("Please Enter Your PIN Code"),

          // -- Delivery Dispatch Methods
          if (notifier.showDeliverMethods)
            for (int i = 0; i < kDeliverOptionsIcons.length; i++)
              DeliveryDispatchMethodWidget(
                icon: kDeliverOptionsIcons[i],
                text: kDeliveyOptionsTitles[i],
              ),
        ],
      );
    });
  }

  // -- Text Field Border Style
  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: kBorderRadius12,
      borderSide: const BorderSide(
        color: kHintTextColor,
      ),
    );
  }

  // -- Error Text
  Text errorText(String errorText) {
    return Text(
      errorText,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
