import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final String title;
  final Color? color;
  final Function() onTap;
  const ButtonSecondary(
      {super.key, required this.title, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: color ?? AppColor.primary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: TextStyle(color: color ?? AppColor.primary),
          ),
        ));
  }
}
