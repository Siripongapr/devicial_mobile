import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/router.dart';
import 'package:devicial_mobile/screen/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.backgroundDark),
        scaffoldBackgroundColor:
            ThemeColor.backgroundDark, // Set the background color here
        useMaterial3: true,
      ),
      home: LoginPage(),
      onGenerateRoute: RouterScreen.generateRoute,
    );
  }
}
