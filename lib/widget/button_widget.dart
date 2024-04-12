import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.text = '',
      this.image = '',
      this.top = 0.0,
      this.bottom = 0.0,
      this.left = 0.0,
      this.right = 0.0,
      required this.onPressed});
  final String text;
  final String image;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: SizedBox(
          height: 48,
          width: double.infinity,
          child: Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  backgroundColor: ThemeColor.textBox,
                  foregroundColor: ThemeColor.textBox),
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
            ),
          )),
    );
  }
}
