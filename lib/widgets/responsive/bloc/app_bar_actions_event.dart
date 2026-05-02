part of 'app_bar_actions_bloc.dart';

@freezed
sealed class AppBarActionsEvent with _$AppBarActionsEvent {
  const factory AppBarActionsEvent.computeActions({
    required List<AppBarWidget> additionalActions,
    @Default(3) int maxVisibleActions,
  }) = _ComputeActions;
}
