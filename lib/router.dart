import 'package:devicial_mobile/screen/login/login_page.dart';
import 'package:devicial_mobile/screen/login/register_page.dart';
import 'package:flutter/material.dart';

class RouterScreen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/login'),
            builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/register'),
            builder: (_) => RegisterPage());

      // case '/register':
      //   return MaterialPageRoute(
      //       settings: const RouteSettings(name: '/register'),
      //       builder: (_) => const Register());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
