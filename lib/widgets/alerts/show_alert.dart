import 'package:flutter/material.dart';

import 'alert_type.dart';

/// Shows an alert message to the user using an AlertDialog
///
/// [context] - BuildContext to show the alert in
/// [title] - Title text for the alert
/// [message] - Message text for the alert
/// [type] - Type of alert (success, error, warning, info). Defaults to success.
void showAlert(
  BuildContext context, {
  required String? title,
  required String message,
  AlertType type = AlertType.success,
}) {
  final color = type.getColor(context);
  final icon = type.icon;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 48),
          const SizedBox(height: 16),
          if (title != null) ...[
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
          Text(
            message,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
