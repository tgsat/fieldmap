import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fieldmap/utils/utils.dart';

class LargeScreen extends StatefulWidget {
  final Widget child;
  const LargeScreen({super.key, required this.child});

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
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
      child: Scaffold(
        body: ButtonFocusScope(
          child: SelectionArea(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    Material(
                      color: AppColor.white,
                      child: AnimatedContainer(
                        height: showAppbar ? 80.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: SizeConfig.maxWidth(context),
                              decoration: CardBorder.general(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomScrollView(
                        shrinkWrap: true,
                        controller: scrollViewController,
                        slivers: [
                          SliverToBoxAdapter(
                            child: Material(
                              color: AppColor.white,
                              child: Column(
                                children: [
                                  widget.child,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
