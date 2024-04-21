import 'package:devicial_mobile/blocs/register/register_cubit.dart';
import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/materials/widget/button_widget.dart';
import 'package:devicial_mobile/materials/widget/date_pick.dart';
import 'package:devicial_mobile/materials/widget/dialog_widget.dart';
import 'package:devicial_mobile/materials/widget/text_button_widget.dart';
import 'package:devicial_mobile/materials/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController gender = TextEditingController();
  late RegisterCubit registerCubit;
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

  void showLoading(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 288,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(), // Replace with your loading indicator widget
                  SizedBox(height: 20),
                  Text(
                    'REGISTERING...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    registerCubit = BlocProvider.of<RegisterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                Navigator.pop(context);
                setState(() {
                  validate = true;
                });
              } else if (state is RegisterSuccess) {
                Navigator.pop(context);
                showCustomDialog(context);
              } else if (state is RegisterLoading) {
                showLoading(context);
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: ThemeColor.background,
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    TextFormFieldWidget(
                      controller: username,
                      top: 45,
                      bottom: btTf.b,
                      left: hzt.l,
                      right: hzt.r,
                      hintText: 'username',
                    ),
                    TextFormFieldWidget(
                      controller: password,
                      bottom: btTf.b,
                      left: hzt.l,
                      right: hzt.r,
                      hintText: 'password',
                    ),
                    TextFormFieldWidget(
                      controller: email,
                      bottom: btTf.b,
                      left: hzt.l,
                      right: hzt.r,
                      hintText: 'email',
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: DatePick(
                          dateController: date,
                          padding: hzt.l,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: gender,
                            right: hzt.r,
                            hintText: 'gender',
                          ),
                        ),
                      ],
                    ),
                    !validate
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(right: hzt.r),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'please enter all data',
                                style: TextStyle(
                                    color: ThemeColor.validateError,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                    ButtonWidget(
                      top: 259,
                      text: 'Register',
                      onPressed: () {
                        registerCubit.register(
                          username.text,
                          password.text,
                          email.text,
                          date.text,
                          gender.text,
                        );
                      },
                      left: 86,
                      right: 86,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
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
