import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part '{{feature_name.snakeCase()}}_analytics_state.dart';
part '{{feature_name.snakeCase()}}_analytics_event.dart';
part '{{feature_name.snakeCase()}}_analytics_bloc.freezed.dart';
part '{{feature_name.snakeCase()}}_analytics_bloc.g.dart';

/// Analytics BLoC for {{feature_name.titleCase()}} feature
/// Handles all analytics events related to {{feature_name.titleCase()}}
class {{feature_name.pascalCase()}}AnalyticsBloc
    extends Bloc<{{feature_name.pascalCase()}}AnalyticsEvent, {{feature_name.pascalCase()}}AnalyticsState> {
  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;

  {{feature_name.pascalCase()}}AnalyticsBloc({
    AnalyticsService? analyticsService,
    CrashlyticsService? crashlyticsService,
  })  : _analyticsService = analyticsService ?? GetIt.I<AnalyticsService>(),
        _crashlyticsService =
            crashlyticsService ?? GetIt.I<CrashlyticsService>(),
        super(const {{feature_name.pascalCase()}}AnalyticsState()) {
    on<_LogScreenView>(_onLogScreenView);
    on<_LogEvent>(_onLogEvent);
    on<_RecordError>(_onRecordError);
    on<_SetUserContext>(_onSetUserContext);
  }

  FutureOr<void> _onLogScreenView(
    _LogScreenView event,
    Emitter<{{feature_name.pascalCase()}}AnalyticsState> emit,
  ) async {
    try {
      await _analyticsService.logScreenView(
        screenName: event.screenName,
        parameters: event.parameters,
      );
    } catch (e, stackTrace) {
      debugPrint('Failed to log screen view: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  FutureOr<void> _onLogEvent(
    _LogEvent event,
    Emitter<{{feature_name.pascalCase()}}AnalyticsState> emit,
  ) async {
    try {
      await _analyticsService.logEvent(event.event);
    } catch (e, stackTrace) {
      debugPrint('Failed to log event: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  FutureOr<void> _onRecordError(
    _RecordError event,
    Emitter<{{feature_name.pascalCase()}}AnalyticsState> emit,
  ) async {
    try {
      await _crashlyticsService.recordError(
        event.exception,
        event.stackTrace,
        reason: event.reason,
        fatal: event.fatal,
      );
    } catch (e, stackTrace) {
      debugPrint('Failed to record error: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  FutureOr<void> _onSetUserContext(
    _SetUserContext event,
    Emitter<{{feature_name.pascalCase()}}AnalyticsState> emit,
  ) async {
    try {
      for (final entry in event.context.entries) {
        await _crashlyticsService.setCustomKey(entry.key, entry.value);
      }
    } catch (e, stackTrace) {
      debugPrint('Failed to set user context: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }
}
