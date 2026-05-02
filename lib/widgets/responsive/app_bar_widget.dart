import 'package:flutter/material.dart';
import 'package:flutter_utils/widgets/responsive/responsive_const.dart';
import 'package:flutter_utils/widgets/responsive/responsive_value.dart';

abstract class AppBarWidget {
  Widget build(BuildContext context);
}

class SimpleAppBarWidget implements AppBarWidget {
  final String title;
  final String? tooltip;
  final Icon icon;
  final Function()? onPressed;

  SimpleAppBarWidget({
    required this.title,
    this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = IconButton(
      tooltip: tooltip ?? title,
      onPressed: onPressed,
      icon: icon,
    );
    final desktop = TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(title),
    );
    final page = responsiveValue({
      Breakpoint.mobile: mobile,
      Breakpoint.tablet: desktop,
      Breakpoint.desktop: desktop,
    });
    return page;
  }
}

class BuilderAppBarWidget implements AppBarWidget {
  Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return builder.call(context);
  }

  BuilderAppBarWidget({required this.builder});
}
