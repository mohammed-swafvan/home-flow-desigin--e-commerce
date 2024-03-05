import 'package:flutter/material.dart';

// -- Import application provider
import 'package:provider/provider.dart';
import 'package:home_screen_flow/application/search_notifier.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

// -- Import Iconsax package
import 'package:iconsax/iconsax.dart';

class SearchHeaderSection extends StatefulWidget {
  const SearchHeaderSection({
    super.key,
  });

  @override
  State<SearchHeaderSection> createState() => _SearchHeaderSectionState();
}

class _SearchHeaderSectionState extends State<SearchHeaderSection> {
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchNotifier>(builder: (context, notifier, _) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 46, bottom: 12),
        decoration: BoxDecoration(
          color: kAppBarColor,
          boxShadow: kCardShadow,
        ),
        child: TextFormField(
          onChanged: (value) {
            notifier.runFilter();
          },
          focusNode: focusNode,
          controller: notifier.searchController,
          keyboardType: TextInputType.text,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            // -- Prefix Button
            prefixIcon: InkWell(
              onTap: () {
                notifier.clearSearchController();
                FocusScope.of(context).unfocus();
                Navigator.of(context).pop();
              },
              child: const Icon(
                Iconsax.arrow_left,
                size: 25,
                color: Colors.black,
              ),
            ),
            // -- Suffix Button
            suffixIcon: InkWell(
              onTap: () {
                notifier.clearSearchController();
                FocusScope.of(context).unfocus(); //
              },
              child: const Icon(
                Iconsax.close_circle,
                size: 24,
                color: kSubtitleColor,
              ),
            ),

            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: getInputBorder,
            enabledBorder: getInputBorder,
            border: getInputBorder,
            hintText: "Search Anything...",
            hintStyle: const TextStyle(
              fontSize: 17,
              color: kHintTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    });
  }

  // Text Field Border Style
  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: kBorderRadius12,
      borderSide: const BorderSide(
        color: kHintTextColor,
      ),
    );
  }
}
