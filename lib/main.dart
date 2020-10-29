import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music_player/core/di/locator.dart';
import 'package:flutter_music_player/core/routing/router.dart';

import 'core/resources/app_colors.dart';
import 'core/resources/strings.dart';
import 'core/resources/theme.dart';
import 'core/routing/routes.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: Routes.HomePage,
    );
  }
}
