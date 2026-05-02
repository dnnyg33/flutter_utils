import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_utils/styles/color_extensions.dart';
import 'package:flutter_utils/styles/theme_extensions.dart';
import 'package:flutter_utils/widgets/responsive/responsive_const.dart';
import 'package:flutter_utils/widgets/responsive/responsive_value.dart';

import '../widgets/company_logo.dart';
import 'app_bar_interactions.dart';
import 'app_bar_widget.dart';
import 'bloc/app_bar_actions_bloc.dart';

class AppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesktop({
    super.key,
    required this.interactions,
    this.bottom,
    this.elevation = 4,
    this.titleSpacing = 0,
    this.toolbarHeight = kToolbarHeight,
    this.horizontalSpacer,
  });

  final AppBarInteractions interactions;
  final PreferredSizeWidget? bottom;
  final double elevation;
  final double titleSpacing;
  final double toolbarHeight;
  final double? horizontalSpacer;

  @override
  Size get preferredSize {
    return Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    final edgeSpacer = horizontalSpacer ?? calculateEdgeSpacer();

    return BlocProvider<AppBarActionsBloc>(
      key: ObjectKey(interactions.additionalActions),
      create: (context) => AppBarActionsBloc()
        ..add(
          AppBarActionsEvent.computeActions(
            additionalActions: interactions.additionalActions ?? [],
            maxVisibleActions: 5,
          ),
        ),
      child: BlocBuilder<AppBarActionsBloc, AppBarActionsState>(
        builder: (context, state) {
          return AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: toolbarHeight,
            elevation: elevation,
            centerTitle: false,
            titleSpacing: 0,
            title: SizedBox(
              height: toolbarHeight,
              child: Row(
                children: [
                  SizedBox(width: edgeSpacer),
                  CompanyLogo(onTap: null, padding: EdgeInsets.all(16)),
                  const SizedBox(width: 36),
                  const Spacer(),
                  ...state.visibleActions.map((e) => e.build(context)),
                  if (state.shouldUseOverflow)
                    _buildOverflowMenu(context, state.overflowActions),
                  SizedBox(width: edgeSpacer),
                ],
              ),
            ),
            bottom: bottom,
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

double calculateEdgeSpacer() {
  return valueFor(
    1.sw,
    min: (Breakpoint.tablet.value.toDouble(), 16.0),
    max: (Breakpoint.desktop.value.toDouble(), 100.0),
  );
}
