import 'package:devicial_mobile/blocs/login/login_cubit.dart';
import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/materials/widget/button_widget.dart';
import 'package:devicial_mobile/materials/widget/text_button_widget.dart';
import 'package:devicial_mobile/materials/widget/textfield_widget.dart';
import 'package:devicial_mobile/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool validate = false;
  // Auth loginAPI = Auth();
  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = BlocProvider.of<LoginCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 148),
            child: Column(
              children: [
                const Text(
                  'DEVICIAL',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                TextFormFieldWidget(
                  controller: username,
                  left: 48,
                  right: 48,
                  top: 112,
                  bottom: 24,
                  hintText: 'username',
                ),
                TextFormFieldWidget(
                  controller: password,
                  left: 48,
                  right: 48,
                  bottom: 6,
                  hintText: 'password',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'wrong username or password',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: validate
                                ? ThemeColor.validateError
                                : Colors.transparent),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 241, top: 27),
                    child: TextButtonWidget(
                      onPressed: () {
                        print('pressed');
                        Navigator.pushNamed(context, '/register');
                      },
                      text: 'create an account',
                    )),
                Column(
                  children: [
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoading) {
                          print('loading . . .');
                        } else if (state is LoginSuccess) {
                          Navigator.pushNamed(context, '/dashboard');
                        } else if (state is LoginError) {
                          print('error ! ! !');
                          setState(() {
                            validate = true;
                          });
                        }
                      },
                      child: ButtonWidget(
                        text: 'LOGIN',
                        onPressed: () async {
                          print(validate);
                          loginCubit.login(username.text, password.text);
                          // await loginAPI.login(username.text, password.text);
                          // loginAPI.getInfo();
                          // setState(() {
                          //   validate = !validate;
                          // });
                        },
                        left: 86,
                        right: 86,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
