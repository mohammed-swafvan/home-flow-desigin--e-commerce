import 'package:flutter/cupertino.dart';

class RoundedImageWidget extends StatelessWidget {
  const RoundedImageWidget({
    super.key,
    required this.image,
    required this.imageWidth,
    this.imageHeight = 120,
    required this.radius,
  });
  final String image;
  final double? imageWidth;
  final double? imageHeight;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
