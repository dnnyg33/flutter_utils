import 'package:flutter/material.dart';
import 'package:flutter_utils/widgets/toast/toast_type.dart';
import 'package:flutter_utils/widgets/toast/toast_widget.dart';

/// Shows a toast notification at the top of the screen
///
/// [context] - BuildContext to show the toast in
/// [message] - Message text for the toast
/// [type] - Type of toast (success, error, warning, info)
/// [title] - Optional title for the toast
/// [duration] - How long to show the toast. Defaults to 3 seconds.
void showToast(
  BuildContext context, {
  required String message,
  ToastType type = ToastType.info,
  String? title,
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _AnimatedToast(
      duration: duration,
      onDismiss: () => overlayEntry.remove(),
      child: ToastWidget(message: message, type: type, title: title),
    ),
  );

  overlay.insert(overlayEntry);
}

/// Shows a success toast notification
///
/// [context] - BuildContext to show the toast in
/// [message] - Message text for the toast
/// [title] - Optional title for the toast. Defaults to 'Success'
/// [duration] - How long to show the toast. Defaults to 3 seconds.
void showSuccessToast(
  BuildContext context, {
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 3),
}) {
  showToast(
    context,
    message: message,
    type: ToastType.success,
    title: title,
    duration: duration,
  );
}

/// Shows an error toast notification
///
/// [context] - BuildContext to show the toast in
/// [message] - Message text for the toast
/// [title] - Optional title for the toast. Defaults to 'Error'
/// [duration] - How long to show the toast. Defaults to 4 seconds.
void showErrorToast(
  BuildContext context, {
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 4),
}) {
  showToast(
    context,
    message: message,
    type: ToastType.error,
    title: title,
    duration: duration,
  );
}

/// Shows a warning toast notification
///
/// [context] - BuildContext to show the toast in
/// [message] - Message text for the toast
/// [title] - Optional title for the toast
/// [duration] - How long to show the toast. Defaults to 3 seconds.
void showWarningToast(
  BuildContext context, {
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 3),
}) {
  showToast(
    context,
    message: message,
    type: ToastType.warning,
    title: title,
    duration: duration,
  );
}

/// Shows an info toast notification
///
/// [context] - BuildContext to show the toast in
/// [message] - Message text for the toast
/// [title] - Optional title for the toast
/// [duration] - How long to show the toast. Defaults to 3 seconds.
void showInfoToast(
  BuildContext context, {
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 3),
}) {
  showToast(
    context,
    message: message,
    type: ToastType.info,
    title: title,
    duration: duration,
  );
}

/// Internal widget that handles toast animations
class _AnimatedToast extends StatefulWidget {
  const _AnimatedToast({
    required this.duration,
    required this.onDismiss,
    required this.child,
  });

  final Duration duration;
  final VoidCallback onDismiss;
  final Widget child;

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    // Auto dismiss after duration
    Future.delayed(widget.duration, () {
      if (mounted) {
        _dismiss();
      }
    });
  }

  Future<void> _dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(onTap: _dismiss, child: widget.child),
          ),
        ),
      ),
    );
  }
}
