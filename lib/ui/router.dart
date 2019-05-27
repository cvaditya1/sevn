import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sevn/ui/views/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("Settings: " + settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Unknown Page'),
                  ),
                ));
    }
  }
}
