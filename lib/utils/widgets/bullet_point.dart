import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fieldmap/utils/utils.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\u2022",
            style: theme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: HandleSize.textSubheaderGeneral(),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text.capitalize!,
              textAlign: ResponsiveWidget.isSmall
                  ? TextAlign.justify
                  : TextAlign.start,
              style: theme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: HandleSize.textSubheaderGeneral(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HandleSize {
  static textSubheaderGeneral() => ResponsiveWidget.isLarge ? 18 : 16;
}
