part of '{{feature_name.snakeCase()}}_analytics_bloc.dart';

@freezed
sealed class {{feature_name.pascalCase()}}AnalyticsEvent
    with _${{feature_name.pascalCase()}}AnalyticsEvent {
  /// Log a screen view
  const factory {{feature_name.pascalCase()}}AnalyticsEvent.logScreenView({
    required String screenName,
    Map<String, dynamic>? parameters,
  }) = _LogScreenView;

  /// Log a custom analytics event
  const factory {{feature_name.pascalCase()}}AnalyticsEvent.logEvent({
    required AnalyticsEvent event,
  }) = _LogEvent;

  /// Record an error to crashlytics
  const factory {{feature_name.pascalCase()}}AnalyticsEvent.recordError({
    required dynamic exception,
    StackTrace? stackTrace,
    String? reason,
    bool? fatal,
  }) = _RecordError;

  /// Set user context for analytics and crashlytics
  const factory {{feature_name.pascalCase()}}AnalyticsEvent.setUserContext({
    required Map<String, dynamic> context,
  }) = _SetUserContext;
}
