import 'package:flutter/material.dart';
import 'package:flutter_utils/styles/color_extensions.dart';
import 'package:flutter_utils/styles/theme_extensions.dart';

/// Has a dark color, so it's visible on light backgrounds.
class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    required this.onPressed,
    this.color,
    this.padding,
  });

  final Color? color;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Back',
      identifier: 'btn_back',
      child: IconButton(
        icon: ArrowBackIcon(color: color),
        onPressed: onPressed,
        splashRadius: 24,
      ),
    );
  }
}

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.navigate_before, color: color ?? context.colors.primary);
  }
}
