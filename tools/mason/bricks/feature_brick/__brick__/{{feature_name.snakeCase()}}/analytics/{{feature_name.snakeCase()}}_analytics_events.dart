import 'package:core/core.dart';

/// Feature-specific analytics events for {{feature_name.titleCase()}}
/// Extend AnalyticsEvent to create type-safe event tracking

/// Example: {{feature_name.titleCase()}} screen viewed event
class {{feature_name.pascalCase()}}ViewedEvent extends AnalyticsEvent {
  {{feature_name.pascalCase()}}ViewedEvent({Map<String, dynamic>? additionalParams})
      : super(
          name: '{{feature_name.snakeCase()}}_viewed',
          parameters: additionalParams,
        );
}

/// Example: {{feature_name.titleCase()}} action performed event
class {{feature_name.pascalCase()}}ActionEvent extends AnalyticsEvent {
  {{feature_name.pascalCase()}}ActionEvent({
    required String actionType,
    Map<String, dynamic>? additionalParams,
  }) : super(
          name: '{{feature_name.snakeCase()}}_action',
          parameters: {
            'action_type': actionType,
            ...?additionalParams,
          },
        );
}

/// Example: {{feature_name.titleCase()}} completed event
class {{feature_name.pascalCase()}}CompletedEvent extends AnalyticsEvent {
  {{feature_name.pascalCase()}}CompletedEvent({
    required Duration duration,
    Map<String, dynamic>? additionalParams,
  }) : super(
          name: '{{feature_name.snakeCase()}}_completed',
          parameters: {
            'duration_seconds': duration.inSeconds,
            ...?additionalParams,
          },
        );
}

/// Example: {{feature_name.titleCase()}} error event
class {{feature_name.pascalCase()}}ErrorEvent extends AnalyticsEvent {
  {{feature_name.pascalCase()}}ErrorEvent({
    required String errorType,
    required String errorMessage,
    Map<String, dynamic>? additionalParams,
  }) : super(
          name: '{{feature_name.snakeCase()}}_error',
          parameters: {
            'error_type': errorType,
            'error_message': errorMessage,
            ...?additionalParams,
          },
        );
}

// TODO: Add more feature-specific analytics events here
// Examples:
// - Data loaded events
// - User interactions
// - State changes
// - Performance metrics
