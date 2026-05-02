import 'package:flutter/material.dart';

/// A primary button that can display a loading spinner and be disabled during async operations.
///
/// When [showSpinner] is true, the button becomes disabled and shows a
/// circular progress indicator next to the label text.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.showSpinner = false,
    this.style,
    super.key,
  });

  /// Callback when the button is pressed. Set to null to disable the button.
  final VoidCallback? onPressed;

  /// The icon to display in the button.
  final Widget icon;

  /// The label text to display in the button.
  final String label;

  /// Whether to show the loading spinner and disable the button.
  final bool showSpinner;

  /// Optional button style. If not provided, uses default FilledButton styling.
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: showSpinner ? null : onPressed,
      icon: icon,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (showSpinner) ...[
            const SizedBox(width: 12),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ),
          ],
        ],
      ),
      style: style,
    );
  }
}
