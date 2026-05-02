import 'package:flutter/material.dart';

/// A generic error widget to display when a page or data fails to load.
///
/// Shows an error icon, error message, and optional retry button.
class ErrorLoadWidget extends StatelessWidget {
  const ErrorLoadWidget({super.key, this.message, this.onRetry});

  /// Optional error message to display. Defaults to a generic message.
  final String? message;

  /// Optional retry callback. If provided, shows a retry button.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 24),
            Text(
              message ?? 'Error loading',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Error loading',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
