import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

import 'widgets/body.dart';
import 'widgets/header_card.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamicAppLabel(
      context: context,
      label: "${Dictionary.appName} | ${Dictionary.appNameSub}",
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.app,
        body: ButtonFocusScope(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: const ResponsiveWidget(
              large: BodyForm(
                child: HeaderCard(),
              ),
              medium: BodyForm(
                child: HeaderCard(),
              ),
              small: BodyForm(
                child: HeaderCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
