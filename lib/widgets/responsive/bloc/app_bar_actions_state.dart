part of 'app_bar_actions_bloc.dart';

@freezed
sealed class AppBarActionsState with _$AppBarActionsState {
  const factory AppBarActionsState({
    @Default([]) List<AppBarWidget> visibleActions,
    @Default([]) List<AppBarWidget> overflowActions,
    @Default(false) bool shouldUseOverflow,
  }) = _AppBarActionsState;
}
