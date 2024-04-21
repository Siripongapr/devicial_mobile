import 'package:devicial_mobile/blocs/login/login_cubit.dart';
import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/repository/auth.dart';
import 'package:devicial_mobile/router.dart';
import 'package:devicial_mobile/screen/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit(Auth())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ThemeColor.backgroundDark),
          scaffoldBackgroundColor:
              ThemeColor.backgroundDark, // Set the background color here
          useMaterial3: true,
        ),
        home: LoginPage(),
        onGenerateRoute: RouterScreen.generateRoute,
      ),
    );
  }
}
