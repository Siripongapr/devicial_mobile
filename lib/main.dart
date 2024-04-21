import 'package:cookie_jar/cookie_jar.dart';
import 'package:devicial_mobile/blocs/login/login_cubit.dart';
import 'package:devicial_mobile/blocs/register/register_cubit.dart';
import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/repository/auth.dart';
import 'package:devicial_mobile/router.dart';
import 'package:devicial_mobile/screen/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the application documents directory
  var appDocDir = await getApplicationDocumentsDirectory();
  var cookiePath = '${appDocDir.path}/cookies';

  // Initialize the cookie jar with the storage path
  var cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));

  // Clear all cookies
  await cookieJar.deleteAll();

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
        BlocProvider<LogoutCubit>(create: (context) => LogoutCubit(Auth())),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit(Auth())),
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
