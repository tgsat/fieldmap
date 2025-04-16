import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final bool isCenter;
  const MaxWidthContainer({
    super.key,
    required this.child,
    this.isCenter = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return isCenter
        ? Center(
            child: Container(
              color: color,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 210,
                  maxWidth: SizeConfig.kMaxWidth,
                ),
                child: child,
              ),
            ),
          )
        : Container(
            color: color,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 210,
                maxWidth: SizeConfig.kMaxWidth,
              ),
              child: child,
            ),
          );
  }
}
