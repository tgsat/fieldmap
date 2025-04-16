import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fieldmap/utils/utils.dart';

class MediumScreen extends StatefulWidget {
  final Widget child;
  const MediumScreen({super.key, required this.child});

  @override
  State<MediumScreen> createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen> {
  late ScrollController scrollViewController;
  bool showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    scrollViewController = ScrollController();
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          setState(() {});
        }
      }

      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    scrollViewController.dispose();
    scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelectionArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Scaffold(body: widget.child),
        ),
      ),
    );
  }
}
