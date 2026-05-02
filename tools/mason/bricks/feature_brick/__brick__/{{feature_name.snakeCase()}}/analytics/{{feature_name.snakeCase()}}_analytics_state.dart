part of '{{feature_name.snakeCase()}}_analytics_bloc.dart';

@freezed
sealed class {{feature_name.pascalCase()}}AnalyticsState
    with _${{feature_name.pascalCase()}}AnalyticsState {
  const {{feature_name.pascalCase()}}AnalyticsState._();

  const factory {{feature_name.pascalCase()}}AnalyticsState() =
      _{{feature_name.pascalCase()}}AnalyticsState;

  factory {{feature_name.pascalCase()}}AnalyticsState.fromJson(
          Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}AnalyticsStateFromJson(json);
}
