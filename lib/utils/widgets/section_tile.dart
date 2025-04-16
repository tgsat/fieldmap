import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final bool isRequired;
  const SectionTile({super.key, required this.title, this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return isRequired
        ? Dots(
            isActived: isRequired,
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium))
        : Text(title, style: Theme.of(context).textTheme.bodyMedium);
  }
}
