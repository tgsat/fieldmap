import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final Color? color;
  final bool custom;
  final RoundedRectangleBorder? shape;
  final Function() onTap;
  const ButtonPrimary(
      {super.key,
      required this.title,
      this.color,
      this.custom = false,
      required this.onTap,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: shape,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            side: BorderSide(color: color ?? AppColor.primary)),
        child: custom
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(title))
            : Text(title));
  }
}
