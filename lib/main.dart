import 'package:fieldmap/features/screen/screen.dart';
import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: WebHorizontalScrollBehavior(),
      title: Dictionary.appName,
      home: const FormScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}

class WebHorizontalScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
      PointerDeviceKind.stylus,
      PointerDeviceKind.invertedStylus,
    };
  }
}
