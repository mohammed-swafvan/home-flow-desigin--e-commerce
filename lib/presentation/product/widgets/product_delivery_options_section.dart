import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -- Import application provider
import 'package:home_screen_flow/application/pin_code_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import app presentation widgets
import 'package:home_screen_flow/presentation/product/widgets/pin_code_success.dart';
import 'package:home_screen_flow/presentation/product/widgets/pin_code_text_form_field_widget.dart';

class ProductDeliveryOptionsSection extends StatefulWidget {
  const ProductDeliveryOptionsSection({super.key});

  @override
  State<ProductDeliveryOptionsSection> createState() => _ProductDeliveryOptionsSectionState();
}

class _ProductDeliveryOptionsSectionState extends State<ProductDeliveryOptionsSection> {
  late PinCodeNotifier pinCodeNotifier;

  @override
  void initState() {
    pinCodeNotifier = Provider.of<PinCodeNotifier>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    pinCodeNotifier.focusNode.unfocus();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pinCodeNotifier.clearAll();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16).copyWith(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: kBorderRadius10,
        boxShadow: kCardShadow,
      ),
      child: Consumer<PinCodeNotifier>(
        builder: (context, pinNotifier, _) {
          if (!pinNotifier.showSuccessMessage) {
            // -- PIN Code Text Field
            return const PinCodeTextFormFieldWidget();
          }

          // PIN Code Succes Widget
          return const PinCodeSuccess();
        },
      ),
    );
  }
}
