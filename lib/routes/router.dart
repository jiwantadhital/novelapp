import 'package:flutter/material.dart';
import 'package:novelapp/main.dart';
import 'package:novelapp/side_page/xtra.dart';

const String home= "/";
const String extra= "/extra";

class RouteNav {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Main());
        case extra:
        return MaterialPageRoute(builder: (context) => const Extras());
      
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

