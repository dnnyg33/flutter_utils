import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Enum for responsive design breakpoints.
enum Breakpoint {
  /// Default value, used when no other breakpoint applies.
  mobile(breakpointMobile),

  /// Use for tablets with screen width >= 600px.
  tablet(breakpointTablet),

  /// Use for desktops with screen width >= 900px.
  desktop(breakpointDesktop);

  const Breakpoint(this.value);
  final int value;

  double paddingFor(double maxWidth, [double defaultValue = 24.0]) {
    return math.max(defaultValue, ((maxWidth - value) / 2));
  }
}

class Breakpoints {
  static bool get isDialog {
    return 1.sw >= Breakpoint.tablet.value;
  }

  static bool get isMobile {
    return 1.sw < Breakpoint.tablet.value;
  }

  static bool get isTablet {
    return 1.sw >= Breakpoint.tablet.value && 1.sw < Breakpoint.desktop.value;
  }

  static bool get isDesktop {
    return 1.sw >= Breakpoint.desktop.value;
  }

  static bool get isMobileOrTablet {
    return 1.sw < Breakpoint.desktop.value;
  }

  static bool get isTabletOrDesktop {
    return 1.sw >= Breakpoint.tablet.value;
  }

  static double paddingFor(
    double breakpoint,
    double maxWidth, [
    double defaultValue = 24.0,
  ]) {
    return math.max(defaultValue, ((maxWidth - breakpoint) / 2));
  }
}

const int breakpointMobile = 0;
const int breakpointTablet = 600;
const int breakpointDesktop = 900;

extension BreakpointX on Breakpoint {
  bool get isMobile => this == Breakpoint.mobile;
  bool get isTablet => this == Breakpoint.tablet;
  bool get isDesktop => this == Breakpoint.desktop;
}
