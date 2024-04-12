import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/materials/widget/button_widget.dart';
import 'package:devicial_mobile/materials/widget/dialog_widget.dart';
import 'package:devicial_mobile/materials/widget/text_button_widget.dart';
import 'package:devicial_mobile/materials/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController login = TextEditingController();
  bool validate = false;
  PaddingValue hzt = PaddingValue(t: 0, b: 0, l: 48, r: 48);
  PaddingValue btTf = PaddingValue(t: 0, b: 24, l: 0, r: 0);

  void showCustomDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          child: Container(
            height: 288,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'REGISTER SUCCESSFULLY',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  TextButtonWidget(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    text: 'back to login',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true, // set app
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 148),
            child: Column(
              children: [
                const Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                TextFormFieldWidget(
                  controller: login,
                  top: 45,
                  bottom: btTf.b,
                  left: hzt.l,
                  right: hzt.r,
                  hintText: 'username',
                ),
                TextFormFieldWidget(
                  controller: login,
                  bottom: btTf.b,
                  left: hzt.l,
                  right: hzt.r,
                  hintText: 'password',
                ),
                TextFormFieldWidget(
                  controller: login,
                  bottom: btTf.b,
                  left: hzt.l,
                  right: hzt.r,
                  hintText: 're-enter password',
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormFieldWidget(
                        controller: login,
                        left: hzt.l,
                        hintText: 'date',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormFieldWidget(
                        controller: login,
                        right: hzt.r,
                        hintText: 'gender',
                      ),
                    ),
                  ],
                ),
                ButtonWidget(
                  top: 259,
                  text: 'Register',
                  onPressed: () {
                    print(validate);
                    setState(() {
                      validate = !validate;
                    });
                    showCustomDialog(context);
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

class PaddingValue {
  double t;
  double b;
  double l;
  double r;
  PaddingValue({
    required this.t,
    required this.b,
    required this.l,
    required this.r,
  });
}
