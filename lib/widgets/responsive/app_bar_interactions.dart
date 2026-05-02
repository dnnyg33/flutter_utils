import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../alerts/alert_type.dart';
import '../alerts/show_alert.dart';
import 'app_bar_widget.dart';

class AppBarInteractions {
  final bool showDrawer;
  final Function(BuildContext context)? onBackPress;
  final List<AppBarWidget>? additionalActions;

  AppBarInteractions({
    required this.showDrawer,
    required this.onBackPress,
    this.additionalActions,
  });

  factory AppBarInteractions.defaults({
    required BuildContext context,
    Function(BuildContext context)? onBackPress,
    bool showDrawer = true,
    bool showHelp = true,
    List<AppBarWidget>? additionalActions,
  }) {
    final actions = [...?additionalActions];
    if (showHelp) {
      actions.add(
        SimpleAppBarWidget(
          icon: Icon(Icons.help_outline),
          title: 'Help',
          onPressed: () {
            showAlert(
              context,
              title: 'Coming soon',
              message: 'This feature will be available soon',
              type: AlertType.info,
            );
          },
        ),
      );
    }
    return AppBarInteractions(
      showDrawer: showDrawer,
      onBackPress: (BuildContext context) {
        onBackPress?.call(context) ?? context.maybePop();
      },
      additionalActions: actions,
    );
  }

  AppBarInteractions changeBackButtonVisibility({
    required bool showBackButton,
  }) {
    return AppBarInteractions(
      showDrawer: showDrawer,
      onBackPress: showBackButton ? onBackPress : null,
      additionalActions: additionalActions,
    );
  }
}
