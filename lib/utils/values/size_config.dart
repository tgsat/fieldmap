import 'package:flutter/material.dart';

class SizeConfig {
  // Fonts sizes
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  // button sizes
  static const double buttonHeight = 18.0;
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

  // Padding & Marging sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double dl = 18.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Images sizes
  static const double imageSmall = 35.0;
  static const double imageMedium = 85.0;
  static const double imageLarge = 120.0;

  // Icons sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconDl = 28.0;
  static const double iconLg = 32.0;

  // Input fields
  static const double inputFielsRadius = 12.0;
  static const double spaceBtwInputFiels = 12.0;

  /// [Basic]
  static const double marginHSpace = 20.0;
  static const double marginVSpace = 90.0;
  static const double marginMVSpace = 70.0;
  static const double marginSVSpace = 50.0;
  static const double marginTVSpace = 30.0;

  /// [Spacer]
  static const double hSpacerLarge = 40.0;
  static const double hSpacerMedium = 32.0;
  static const double hSpacerSmall = 20.0;

  // Responsive size
  static const double kMaxWidth = 1200;
  static const double kMaxWidthForm = 720;
  static const int largeScreenSize = 1366;
  static const int mediumScreenSize = 768;
  static const int smallSceenSize = 360;
  static const int customScreenSize = 1100;

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
