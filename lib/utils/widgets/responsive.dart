import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;

  static late bool isSmall;
  static late bool isMedium;
  static late bool isLarge;

  const ResponsiveWidget({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
  });

  _assignBool({
    bool isSmall = false,
    bool isMedium = false,
    bool isLarge = false,
  }) {
    ResponsiveWidget.isSmall = isSmall;
    ResponsiveWidget.isMedium = isMedium;
    ResponsiveWidget.isLarge = isLarge;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          _assignBool(isLarge: true);
          return large;
        } else if (constraints.maxWidth >= 650) {
          _assignBool(isMedium: true);
          return medium;
        } else {
          _assignBool(isSmall: true);
          return small;
        }
      },
    );
  }
}
