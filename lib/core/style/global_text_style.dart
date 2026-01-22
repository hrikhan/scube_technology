import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class GlobalTextStyle {
  GlobalTextStyle._();

  /// Common Inter text style builder so usage stays consistent across the app.
  static TextStyle inter({
    Color color = AppColors.primaryText,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,

    /// line height multiplier (e.g. 1.2, 1.4)
    double? lineHeight,

    /// letter spacing in logical pixels (e.g. 0.2, 0.5)
    double? letterSpacing,

    TextDecoration? decoration,
  }) {
    return GoogleFonts.inter(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle headingWhite = inter(
    color: AppColors.textWhite,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle subheadingWhite = inter(
    color: AppColors.textWhite,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headingDark = inter(
    color: AppColors.primaryText,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyLight = inter(
    color: const Color(0xFF9E9E9E),
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle secondaryAction = inter(
    color: const Color(0xFF9E9E9E),
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle primaryAction = inter(
    color: AppColors.primary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonText = inter(
    color: AppColors.textWhite,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
