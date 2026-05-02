import 'package:flutter/material.dart';
import 'package:flutter_utils/widgets/toast/toast_type.dart';

/// A toast notification widget that displays a message with an icon
class ToastWidget extends StatelessWidget {
  const ToastWidget({
    required this.message,
    required this.type,
    this.title,
    super.key,
  });

  /// The message to display in the toast
  final String message;

  /// The type of toast (success, error, warning, info)
  final ToastType type;

  /// Optional title for the toast
  final String? title;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = type.getBackgroundColor(context);
    final icon = type.icon;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  message,
                  style: TextStyle(
                    fontSize: title != null ? 14 : 16,
                    color: Colors.white,
                    fontWeight: title != null
                        ? FontWeight.w400
                        : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
