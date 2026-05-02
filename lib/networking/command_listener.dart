import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CommandListener handles one-shot commands emitted by a bloc so the logic
/// isn't duplicated across wrapper BlocListener instances.
/// Subclasses should react to commands and then clear them in the bloc.

/// The CommandListener name should match the name of the Bloc it is proxying
abstract class CommandListener<B extends StateStreamable<S>, S>
    extends BlocListener<B, S> {
  final void Function(BuildContext context, S state) onCommand;

  const CommandListener({
    required this.onCommand,
    super.key,
    super.child,
    super.listenWhen,
  }) : super(listener: onCommand);

  @visibleForTesting
  void testOnDataChanged(BuildContext context, S state) {
    onCommand(context, state);
  }
}
