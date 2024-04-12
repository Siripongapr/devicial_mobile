import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/materials/widget/button_widget.dart';
import 'package:devicial_mobile/materials/widget/text_button_widget.dart';
import 'package:devicial_mobile/materials/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController login = TextEditingController();
  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: login,
                  left: 48,
                  right: 48,
                  top: 112,
                  bottom: 24,
                  hintText: 'username',
                ),
                TextFormFieldWidget(
                  controller: login,
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
                      },
                    )),
                ButtonWidget(
                  text: 'LOGIN',
                  onPressed: () {
                    print(validate);
                    setState(() {
                      validate = !validate;
                    });
                  },
                  left: 86,
                  right: 86,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
