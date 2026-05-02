import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    super.key,
    required this.onTap,
    this.padding,
    this.darkBackground = false,
    this.height = 80,
  });

  final void Function(BuildContext)? onTap;
  final EdgeInsets? padding;
  final bool darkBackground;
  final double height;

  @override
  Widget build(BuildContext context) {
    final assetPath = darkBackground
        ? 'packages/core/assets/images/fishbowl_logo_light.png'
        : 'packages/core/assets/images/fishbowl_logo_dark.png';

    return GestureDetector(
      onTap: () => onTap?.call(context),
      child: Center(
        child: Padding(
          padding: padding ?? const EdgeInsets.only(bottom: 12, left: 24),
          child: Image.asset(assetPath, height: height),
        ),
      ),
    );
  }
}
