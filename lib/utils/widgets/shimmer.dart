import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double width;
  final double height;
  final Widget? child;

  const Skeleton({
    super.key,
    this.borderRadius,
    this.width = 0,
    this.height = 0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: Shimmer.fromColors(
        highlightColor: const Color(0xFFF5F5F5),
        baseColor: const Color(0xFFE7E7E7),
        period: const Duration(seconds: 2),
        child: child ??
            Container(
              color: Colors.white,
              width: width,
              height: height,
            ),
      ),
    );
  }
}
