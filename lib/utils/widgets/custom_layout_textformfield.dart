import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomLayoutTextFormField extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isScreen, isRequired;
  final int rightFlex;
  const CustomLayoutTextFormField({
    super.key,
    required this.title,
    required this.child,
    this.isScreen = false,
    this.isRequired = false,
    this.rightFlex = 3,
  });

  static Widget isSmallLayout(
      BuildContext context, bool isRequired, String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTile(isRequired: isRequired, title: title),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  static Widget isLargeLayout(BuildContext context, bool isRequired,
      String title, int rightFlex, Widget child) {
    return Row(
      children: [
        Expanded(
            flex: 1, child: SectionTile(isRequired: isRequired, title: title)),
        const SizedBox(width: 10),
        Expanded(flex: rightFlex, child: child),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isScreen
        ? isLargeLayout(context, isRequired, title, rightFlex, child)
        : isSmallLayout(context, isRequired, title, child);
  }
}
