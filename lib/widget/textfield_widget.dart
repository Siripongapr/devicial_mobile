import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.hintText = '',
    this.image = '',
    required this.controller,
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 0.0,
    this.right = 0.0,
  });
  final String hintText;
  final String image;
  final double top;
  final double bottom;
  final double left;
  final double right;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: SizedBox(
        height: 48,
        child: TextField(
          obscureText: false,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: image.isNotEmpty
                ? SizedBox(width: 27, child: Image.asset(image))
                : null,
            fillColor: ThemeColor.textBox,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide.none),
            label: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  hintText,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
