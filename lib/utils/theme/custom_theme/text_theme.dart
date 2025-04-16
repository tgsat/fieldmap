import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class TextThemes {
  TextThemes._();

  static TextTheme textTheme = TextTheme(
    // headline
    headlineLarge: GoogleFonts.poppins().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.poppins().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: GoogleFonts.poppins().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    // title
    titleLarge: GoogleFonts.poppins().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: GoogleFonts.poppins().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.poppins().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    // body
    bodyLarge: GoogleFonts.poppins().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColor.textLight),
    bodyMedium: GoogleFonts.poppins().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColor.textLight),
    bodySmall: GoogleFonts.poppins().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColor.textLight),
    // Label
    labelLarge: GoogleFonts.poppins().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: GoogleFonts.poppins().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );
}
