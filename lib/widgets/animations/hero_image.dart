import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String tag;
  final String imagePath;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxFit fit;

  const HeroImage({
    super.key,
    required this.tag,
    required this.imagePath,
    this.height,
    this.width,
    this.borderRadius,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.asset(
          imagePath,
          fit: fit,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
