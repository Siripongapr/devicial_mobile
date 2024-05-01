import 'package:devicial_mobile/screen/dashboard/dashboard_page.dart';
import 'package:devicial_mobile/screen/login/login_page.dart';
import 'package:devicial_mobile/screen/login/register_page.dart';
import 'package:devicial_mobile/screen/post/new_post.dart';
import 'package:devicial_mobile/screen/post/view_post.dart';
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
      case '/dashboard':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/dashboard'),
            builder: (_) => DashBoard());
      case '/newPost':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/newPost'),
            builder: (_) => NewPost());
      case '/viewPost':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/viewPost'),
            builder: (_) => ViewPostPage());

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
