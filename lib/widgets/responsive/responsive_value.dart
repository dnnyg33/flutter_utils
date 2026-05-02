import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_utils/widgets/responsive/responsive_const.dart';

/// Returns the value that corresponds to the current device width.
///
/// If no value is provided for the current device width, the value
/// for the mobile breakpoint is returned.
///
/// Example:
/// final value responsiveValue = responsiveValue(context, {
///    Breakpoint.mobile: 'something sized for mobile',
///    Breakpoint.tablet: 'something sized for tablet',
///    Breakpoint.desktop: 'something sized for desktop',
/// });
T responsiveValue<T>(Map<Breakpoint, T> values) {
  final width = 1.sw;
  T? currentValue = values[Breakpoint.mobile];

  if (width >= Breakpoint.tablet.value) {
    currentValue = values[Breakpoint.tablet] ?? currentValue;
  }
  if (width >= Breakpoint.desktop.value) {
    currentValue = values[Breakpoint.desktop] ?? currentValue;
  }

  // Ensure a valid value is always returned
  if (currentValue == null) {
    throw FlutterError('No base value provided for responsiveValue function');
  }

  return currentValue;
}

T? responsiveValueOrNull<T>(Map<Breakpoint, T?> values) {
  final width = 1.sw;
  T? currentValue = values[Breakpoint.mobile];

  if (width >= Breakpoint.tablet.value) {
    currentValue = values[Breakpoint.tablet] ?? currentValue;
  }
  if (width >= Breakpoint.desktop.value) {
    currentValue = values[Breakpoint.desktop] ?? currentValue;
  }

  return currentValue;
}

double valueFor(
  double determinant, {
  required (double min, double minValue) min,
  required (double max, double maxValue) max,
}) {
  // Check if the determinant is outside the given range and clamp it
  if (determinant <= min.$1) return min.$2;
  if (determinant >= max.$1) return max.$2;

  // Apply linear interpolation formula
  return min.$2 +
      ((max.$2 - min.$2) * (determinant - min.$1) ~/ (max.$1 - min.$1));
}
