import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillYellowTL18 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellow10001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.h),
        ),
      );
  static ButtonStyle get fillYellowTL181 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellow100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.h),
        ),
      );
  static ButtonStyle get fillErrorContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.errorContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23.h),
    ),
  );
// text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
