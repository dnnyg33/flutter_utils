import 'package:flutter/material.dart';

/// Type of alert to display
enum AlertType {
  success,
  error,
  warning,
  info;

  /// Get the icon for this alert type
  IconData get icon {
    switch (this) {
      case AlertType.success:
        return Icons.check_circle;
      case AlertType.error:
        return Icons.error;
      case AlertType.warning:
        return Icons.warning;
      case AlertType.info:
        return Icons.info;
    }
  }

  /// Get the color for this alert type
  Color getColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case AlertType.success:
        return colorScheme.tertiary;
      case AlertType.error:
        return colorScheme.error;
      case AlertType.warning:
        return colorScheme.secondary;
      case AlertType.info:
        return colorScheme.primary;
    }
  }
}
