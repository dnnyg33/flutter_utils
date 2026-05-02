import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// DataProxy should always pass data through to their subscribers
/// They should contain no logic or conditionals and remain very simple
/// Any logic or optimizations should be handled in the receiving bloc
///
/// The DataProxy name should match the name of the Bloc it is proxying
abstract class DataProxy<B extends StateStreamable<S>, S>
    extends BlocListener<B, S> {
  final void Function(BuildContext context, S state) onDataChanged;

  const DataProxy({required this.onDataChanged, super.key, super.child})
    : super(listener: onDataChanged);

  @visibleForTesting
  void testOnDataChanged(BuildContext context, S state) {
    onDataChanged(context, state);
  }

  /// This constructor is used to create a DataProxy that immediately
  ///  calls the onDataChanged callback with the current state of the bloc.
  ///
  /// This is useful if the Bloc being proxied already exists and you
  ///  need the current value as well as future values
  DataProxy.withCurrentState({
    required this.onDataChanged,
    required BuildContext context,
    super.key,
    super.child,
  }) : super(listener: onDataChanged) {
    onDataChanged(context, context.read<B>().state);
  }
}

/// ScopedDataProxy should only listen to the Bloc if the shouldListen
/// condition is met. Should be used to observe a single
/// property on a bloc state
abstract class ScopedDataProxy<B extends StateStreamable<S>, S>
    extends BlocListener<B, S> {
  final void Function(BuildContext context, S state) onDataChanged;
  final BlocListenerCondition<S>? shouldListen;

  const ScopedDataProxy({
    required this.onDataChanged,
    super.key,
    super.child,
    this.shouldListen,
  }) : super(listenWhen: shouldListen, listener: onDataChanged);

  @visibleForTesting
  void testOnDataChanged(BuildContext context, S state) {
    onDataChanged(context, state);
  }

  /// This constructor is used to create a DataProxy that immediately
  ///  calls the onDataChanged callback with the current state of the bloc.
  ///
  /// This is useful if the Bloc being proxied already exists and you
  ///  need the current value as well as future values
  ScopedDataProxy.withCurrentState({
    required this.onDataChanged,
    required BuildContext context,
    super.key,
    super.child,
    this.shouldListen,
  }) : super(listenWhen: shouldListen, listener: onDataChanged) {
    onDataChanged(context, context.read<B>().state);
  }
}
