import 'package:flutter/material.dart';

import 'dynamic_colors.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  DynamicColors get colors {
    return theme.extension<DynamicColors>()!;
  }

  FishbowlTextStyles get textStyles => FishbowlTextStyles._();
}

class FishbowlTextStyles {
  FishbowlTextStyles._();

  // REGULAR
  TextStyle get regular10 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 10);

  TextStyle get regular12 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 12);

  TextStyle get regular14 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

  TextStyle get regular16 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 16);

  TextStyle get regular20 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 20);

  TextStyle get regular24 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 24);

  TextStyle get regular30 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 30);

  TextStyle get regular38 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 38);

  TextStyle get regular46 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 46);

  TextStyle get regular56 =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 56);

  // SEMIBOLD
  TextStyle get semibold10 =>
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 12);

  TextStyle get semibold12 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 12);

  TextStyle get semibold14 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 14);

  TextStyle get semibold16 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

  TextStyle get semibold20 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 20);

  TextStyle get semibold24 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 24);

  TextStyle get semibold30 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 30);

  TextStyle get semibold38 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 38);

  TextStyle get semibold46 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 46);

  TextStyle get semibold56 =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 56);
}
