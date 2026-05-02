import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utils/styles/color_extensions.dart';
import 'package:flutter_utils/styles/theme_extensions.dart';

import 'app_bar_back_button.dart';
import 'app_bar_interactions.dart';
import 'app_bar_widget.dart';
import 'bloc/app_bar_actions_bloc.dart';

class AppBarMobile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMobile({
    super.key,
    required this.title,
    required this.interactions,
    this.subtitle,
    this.elevation,
    this.automaticallyImplyLeading = false,
  });

  final double? elevation;
  final AppBarInteractions interactions;
  final String title;
  final Widget? subtitle;
  final bool automaticallyImplyLeading;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    final elevation = this.elevation ?? 1;

    return BlocProvider<AppBarActionsBloc>(
      key: ObjectKey(interactions.additionalActions),
      create: (context) => AppBarActionsBloc()
        ..add(
          AppBarActionsEvent.computeActions(
            additionalActions: interactions.additionalActions ?? [],
            maxVisibleActions: 3,
          ),
        ),
      child: BlocBuilder<AppBarActionsBloc, AppBarActionsState>(
        builder: (context, state) {
          final visibleActions = state.visibleActions.map(
            (e) => e.build(context),
          );

          Widget? leading;
          if (interactions.onBackPress != null) {
            leading = AppBarBackButton(
              onPressed: () => interactions.onBackPress?.call(context),
            );
          } else if (interactions.showDrawer) {
            leading = IconButton(
              tooltip: 'Menu',
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu, color: context.colors.contentPrimary),
            );
          }

          return PreferredSize(
            preferredSize: preferredSize,
            child: AppBar(
              automaticallyImplyLeading: automaticallyImplyLeading,
              elevation: elevation,
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  if (subtitle != null) ...[subtitle],
                ],
              ),
              titleSpacing: leading != null ? 0 : null,
              leading: leading,
              actions: [
                ...visibleActions,
                if (state.shouldUseOverflow)
                  _buildOverflowMenu(context, state.overflowActions),
              ],
              actionsPadding: const EdgeInsets.only(right: 16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverflowMenu(
    BuildContext context,
    List<AppBarWidget> overflowActions,
  ) {
    return PopupMenuButton<VoidCallback>(
      icon: Icon(Icons.more_vert, color: context.colors.primary),
      tooltip: 'More options',
      onSelected: (callback) => callback(),
      itemBuilder: (context) => overflowActions.map((action) {
        final widget = action.build(context);
        if (widget is IconButton) {
          return PopupMenuItem<VoidCallback>(
            value: () => widget.onPressed?.call(),
            child: Row(
              children: [
                widget.icon,
                const SizedBox(width: 12),
                Text(widget.tooltip ?? ''),
              ],
            ),
          );
        }
        return PopupMenuItem<VoidCallback>(
          value: () {},
          child: const Text('Unknown action'),
        );
      }).toList(),
    );
  }
}
