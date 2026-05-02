import 'package:flutter/material.dart';
import 'package:flutter_utils/styles/theme_extensions.dart';

import '../extensions/enum_extensions.dart';

class ColoredTextPill extends StatelessWidget {
  const ColoredTextPill({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  ColoredTextPill.fromColorPair({
    super.key,
    required ColorPair colorPair,
    required this.text,
  }) : backgroundColor = colorPair.background,
       textColor = colorPair.text;

  final Color? backgroundColor;
  final Color? textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (backgroundColor == null && textColor == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: context.textStyles.regular12.copyWith(color: textColor),
      ),
    );
  }
}
