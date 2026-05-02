import 'package:flutter/material.dart';
import 'package:flutter_utils/widgets/responsive/responsive_const.dart';

class ResponsiveLayout extends StatelessWidget {
  final WidgetBuilder? desktop;
  final WidgetBuilder? tablet;
  final WidgetBuilder mobile;

  /// Uses standard responsive layout breakpoints to determine which layout to show.
  /// Priority is [desktop] > [tablet] > [mobile] for each respective breakpoint.
  ///
  /// Usage:
  /// - Top level layout of a page
  /// - Top level layout of a section
  /// - Top level layout of a widget
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth < Breakpoint.tablet.value) {
      return mobile.call(context);
    } else if (screenWidth < Breakpoint.desktop.value) {
      return tablet?.call(context) ?? mobile.call(context);
    } else {
      return desktop?.call(context) ??
          tablet?.call(context) ??
          mobile.call(context);
    }
  }
}
