import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class Dots extends StatelessWidget {
  final Widget child;
  final bool isActived;
  const Dots({
    super.key,
    required this.child,
    this.isActived = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        child,
        if (isActived)
          Text('*',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: AppColor.red)),
      ],
    );
  }
}
