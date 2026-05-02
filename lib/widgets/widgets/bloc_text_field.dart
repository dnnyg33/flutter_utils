import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A TextField widget that properly manages its TextEditingController lifecycle
/// when integrated with BLoC state.
///
/// This widget solves the anti-pattern of creating new TextEditingController
/// instances on every rebuild, which can cause memory leaks, unnecessary rebuilds,
/// and unexpected behavior.
///
/// Key features:
/// - Controller is created once in initState and properly disposed (unless external controller provided)
/// - Controller text is updated when state changes (didUpdateWidget)
/// - Avoids updating controller if text hasn't changed or if it matches user input
/// - Maintains cursor position at end of text on programmatic updates
/// - Supports external controller (e.g., from FABTextFieldWrapper) for advanced use cases
///
/// Usage:
/// ```dart
/// // Standalone usage (manages own controller)
/// BlocTextField(
///   text: state.quantity,
///   onChanged: (value) {
///     context.read<MyBloc>().add(MyEvent.quantityChanged(value));
///   },
///   decoration: InputDecoration(labelText: 'Quantity'),
///   keyboardType: TextInputType.number,
/// )
///
/// // Password field with submit handling
/// BlocTextField(
///   text: state.password,
///   onChanged: (value) => bloc.add(PasswordChanged(value)),
///   obscureText: true,
///   textInputAction: TextInputAction.done,
///   onSubmitted: (_) => bloc.add(SubmitForm()),
///   decoration: InputDecoration(labelText: 'Password'),
/// )
///
/// // Digits-only field (e.g., MFA code)
/// BlocTextField(
///   text: state.mfaCode,
///   onChanged: (value) => bloc.add(MfaCodeChanged(value)),
///   keyboardType: TextInputType.number,
///   textInputAction: TextInputAction.done,
///   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
///   decoration: InputDecoration(labelText: 'MFA Code'),
/// )
///
/// // With external controller (e.g., from FABTextFieldWrapper)
/// BlocTextField(
///   text: state.search,
///   controller: externalController,
///   onChanged: (value) => bloc.add(SearchChanged(value)),
/// )
/// ```
class BlocTextField extends StatefulWidget {
  /// The text value from BLoC state
  final String text;

  /// Optional external TextEditingController.
  /// If provided, BlocTextField will use this controller instead of creating its own.
  /// The caller is responsible for disposing the external controller.
  /// Useful when integrating with FABTextFieldWrapper or similar widgets.
  final TextEditingController? controller;

  /// Callback when text changes (forward to BLoC)
  final ValueChanged<String>? onChanged;

  /// TextField decoration
  final InputDecoration? decoration;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Whether the field is read-only
  final bool readOnly;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether to obscure the text (e.g., for password fields)
  final bool obscureText;

  /// The type of action button to display on the keyboard
  final TextInputAction? textInputAction;

  /// Callback when the user submits the field (e.g., presses enter)
  final ValueChanged<String>? onSubmitted;

  /// Whether the field should autofocus on mount
  final bool autofocus;

  /// Input formatters to restrict input (e.g., digits only, length limit)
  final List<TextInputFormatter>? inputFormatters;

  const BlocTextField({
    super.key,
    required this.text,
    this.controller,
    this.onChanged,
    this.decoration,
    this.keyboardType,
    this.readOnly = false,
    this.focusNode,
    this.enabled = true,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
    this.autofocus = false,
    this.inputFormatters,
  });

  @override
  State<BlocTextField> createState() => _BlocTextFieldState();
}

class _BlocTextFieldState extends State<BlocTextField> {
  TextEditingController? _internalController;

  /// Returns the controller to use - either external or internal
  TextEditingController get _controller =>
      widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    // Only create internal controller if external one not provided
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.text);
    }
  }

  @override
  void didUpdateWidget(BlocTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle controller swaps between external and internal
    if (oldWidget.controller != widget.controller) {
      if (oldWidget.controller != null && widget.controller == null) {
        // Switching to internal control: create the internal controller
        _internalController = TextEditingController(text: widget.text);
      } else if (oldWidget.controller == null && widget.controller != null) {
        // Switching to external control: dispose internal and use external
        _internalController?.dispose();
        _internalController = null;
      }
    }

    // Only update if text changed from bloc state AND differs from current controller text
    // This prevents overwriting user input while they're typing
    if (widget.text != oldWidget.text && widget.text != _controller.text) {
      _controller.text = widget.text;
      _controller.selection = TextSelection.collapsed(
        offset: widget.text.length,
      );
    }
  }

  @override
  void dispose() {
    // Only dispose internal controller (external controller is managed by caller)
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      autofocus: widget.autofocus,
      inputFormatters: widget.inputFormatters,
    );
  }
}
