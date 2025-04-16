import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class MaxWidthContainerForm extends StatelessWidget {
  final Widget child;
  const MaxWidthContainerForm({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 120,
          maxWidth: SizeConfig.kMaxWidthForm,
        ),
        child: child,
      ),
    );
  }
}
