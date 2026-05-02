import 'dart:ui';

import 'dynamic_colors.dart';


extension ExtraNames on DynamicColors {
  Color get primary => contentPrimaryBlue;
  Color get onPrimary => contentWhite;
  Color get onSurface => contentPrimary;
  Color get surface => bkgdPrimary;
  Color get error => redContent;
  Color get success => greenContent;
  Color get warning => yellowBackground;
  Color get info => blueContent;
  Color get outline => contentSecondary;
}

extension on Color {
  // ignore: unused_element
  Color? variant(int opacity) {
    return withAlpha((opacity * 100 / 255).toInt());
  }
}
