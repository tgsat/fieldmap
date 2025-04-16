import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemes {
  OutlinedButtonThemes._();

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: AppColor.primary, width: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      textStyle: GoogleFonts.poppins(
          fontSize: 15, color: AppColor.primary, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.sm)),
    ),
  );
}
