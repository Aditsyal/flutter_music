import 'package:flutter/material.dart';
import 'package:flutter_music_player/core/routing/routes.dart';
import 'package:flutter_music_player/ui/view/home_page.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HomePage:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}