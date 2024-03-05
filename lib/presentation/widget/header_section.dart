import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

// -- Import application provider
import 'package:home_screen_flow/application/wished_notifier.dart';

// -- Import model class
import 'package:home_screen_flow/domain/product/model/product_model.dart';

// -- Import app constats
import 'package:home_screen_flow/core/constants.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app presentation utils widget
import 'package:home_screen_flow/presentation/utils/snack_bar_utils.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    super.key,
    this.title = "",
    required this.leadingIcon,
    required this.onLeadingButton,
    required this.actionIcons,
    this.isProductScreen = false,
    this.product,
  });
  final IconData leadingIcon;
  final Function()? onLeadingButton;
  final String? title;
  final List<Map<String, dynamic>> actionIcons;
  final bool? isProductScreen;
  final ProductModel? product;

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(top: 40),
      decoration: BoxDecoration(
        color: kAppBarColor,
        boxShadow: kCardShadow,
      ),
      child: Row(
        children: [
          // -- Menu Button
          IconButton(
            onPressed: widget.onLeadingButton,
            icon: Icon(
              widget.leadingIcon,
              size: 26,
            ),
          ),

          // -- Title
          Expanded(
            child: Text(
              widget.title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // -- Icons
          for (int i = 0; i < widget.actionIcons.length; i++)
            Consumer<WishedNotifier>(builder: (context, wishedNotifier, _) {
              return buildActionIcons(
                onTap: widget.isProductScreen!
                    ? () async {
                        if (i == 0) {
                          if (wishedNotifier.wishedIds.contains(widget.product!.id)) {
                            SnackBar snackBar =
                                SnackBarUtils.mainSnackBar(context: context, content: "Item Removed From Favourite");
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            SnackBar snackBar = SnackBarUtils.mainSnackBar(context: context, content: "Item Added To Favourite");
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          wishedNotifier.createWishList(widget.product!.id);
                        } else if (i == 1) {
                          XFile file = await assetToXFile(widget.product!.images[0]);
                          await Share.shareXFiles(
                            [file],
                            text: widget.product!.productName,
                            subject: "${widget.product!.offer}% Offer",
                          );
                        }
                      }
                    : null,
                icon: widget.actionIcons[i]["icon"],
                iconColor: widget.isProductScreen! && i == 0 && wishedNotifier.wishedIds.contains(widget.product!.id)
                    ? kNotificationColor
                    : Colors.black,
                isNotificationIcon: widget.actionIcons[i]["notification"],
              );
            })
        ],
      ),
    );
  }

  Widget buildActionIcons({
    required IconData icon,
    required Color iconColor,
    required bool isNotificationIcon,
    VoidCallback? onTap,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 26,
            color: iconColor,
          ),
        ),
        if (isNotificationIcon)
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.brightness_1,
              color: kNotificationColor,
              size: 4,
            ),
          ),
      ],
    );
  }

  Future<XFile> assetToXFile(String assetName) async {
    ByteData data = await rootBundle.load(assetName);
    List<int> bytes = data.buffer.asUint8List();

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    String tempFilePath = '$tempPath/${DateTime.now().millisecondsSinceEpoch}.png';
    File tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(bytes);

    return XFile(tempFilePath);
  }
}
