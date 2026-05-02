import 'package:flutter/material.dart';

class StringInputDialog extends StatefulWidget {
  final String title;
  final String? hintText;
  final String? initialValue;
  final String confirmText;
  final String cancelText;
  final ValueChanged<String> onSubmit;

  const StringInputDialog({
    super.key,
    required this.title,
    this.hintText,
    this.initialValue,
    this.confirmText = 'Submit',
    this.cancelText = 'Cancel',
    required this.onSubmit,
  });

  @override
  State<StringInputDialog> createState() => _StringInputDialogState();

  static Future<void> show({
    required BuildContext context,
    required String title,
    String? hintText,
    String? initialValue,
    String confirmText = 'Submit',
    String cancelText = 'Cancel',
    required ValueChanged<String> onSubmit,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // Allows dismissal on outside tap
      builder: (context) => StringInputDialog(
        title: title,
        hintText: hintText,
        initialValue: initialValue,
        confirmText: confirmText,
        cancelText: cancelText,
        onSubmit: onSubmit,
      ),
    );
  }
}

class _StringInputDialogState extends State<StringInputDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      Navigator.of(context).pop();
      widget.onSubmit(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: widget.hintText),
        autofocus: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _handleSubmit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.cancelText),
        ),
        FilledButton(onPressed: _handleSubmit, child: Text(widget.confirmText)),
      ],
    );
  }
}
