import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_bar_widget.dart';

part 'app_bar_actions_event.dart';
part 'app_bar_actions_state.dart';
part 'app_bar_actions_bloc.freezed.dart';

class AppBarActionsBloc extends Bloc<AppBarActionsEvent, AppBarActionsState> {
  AppBarActionsBloc() : super(const AppBarActionsState()) {
    on<_ComputeActions>(_onComputeActions);
  }

  FutureOr<void> _onComputeActions(
    _ComputeActions event,
    Emitter<AppBarActionsState> emit,
  ) {
    final additionalActions = event.additionalActions;
    final maxVisibleActions = event.maxVisibleActions;

    final shouldUseOverflow = additionalActions.length > maxVisibleActions;

    List<AppBarWidget> visibleActions;
    List<AppBarWidget> overflowActions;

    if (shouldUseOverflow) {
      final visibleCount = maxVisibleActions - 1;
      visibleActions = additionalActions.take(visibleCount).toList();
      overflowActions = additionalActions.skip(visibleCount).toList();
    } else {
      visibleActions = additionalActions;
      overflowActions = [];
    }

    emit(
      AppBarActionsState(
        visibleActions: visibleActions,
        overflowActions: overflowActions,
        shouldUseOverflow: shouldUseOverflow,
      ),
    );
  }
}
