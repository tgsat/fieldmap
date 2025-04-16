import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class WrapCard extends StatelessWidget {
  final Widget child;
  final Decoration? decoration;
  final bool isCard, isMargin;
  const WrapCard(
      {super.key,
      required this.child,
      this.isCard = true,
      this.isMargin = true,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMargin
          ? const EdgeInsets.only(top: 20)
          : const EdgeInsets.only(top: 0),
      padding: isCard
          ? const EdgeInsets.all(20)
          : const EdgeInsets.symmetric(vertical: 20),
      decoration: isCard ? decoration ?? CardBorder.formCard() : null,
      child: child,
    );
  }
}
