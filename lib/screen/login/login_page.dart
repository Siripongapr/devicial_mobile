import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/widget/button_widget.dart';
import 'package:devicial_mobile/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController login = TextEditingController();
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
                  bottom: 45,
                  hintText: 'password',
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 241),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'create an account',
                        style: TextStyle(
                            color: ThemeColor.fontBlack,
                            decoration: TextDecoration.underline),
                      )),
                ),
                ButtonWidget(
                  text: 'LOGIN',
                  onPressed: () {},
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
