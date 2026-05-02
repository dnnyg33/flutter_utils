import 'package:flutter/material.dart';
import 'package:flutter_utils/styles/color_extensions.dart';
import 'package:flutter_utils/styles/theme_extensions.dart';

/// Type of toast notification to display
enum ToastType {
  success,
  error,
  warning,
  info;

  /// Get the icon for this toast type
  IconData get icon {
    switch (this) {
      case ToastType.success:
        return Icons.check_circle_rounded;
      case ToastType.error:
        return Icons.error_rounded;
      case ToastType.warning:
        return Icons.warning_rounded;
      case ToastType.info:
        return Icons.info_rounded;
    }
  }

  /// Get the background color for this toast type
  Color getBackgroundColor(BuildContext context) {
    switch (this) {
      case ToastType.success:
        return context.colors.success;
      case ToastType.error:
        return context.colors.error;
      case ToastType.warning:
        return context.colors.warning;
      case ToastType.info:
        return context.colors.info;
    }
  }
}
