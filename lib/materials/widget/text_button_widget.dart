import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.onPressed,
      this.text = 'default',
      this.underline = true,
      this.fontSize = 14});
  final void Function()? onPressed;
  final String text;
  final bool underline;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors
                  .transparent; // Set overlay color to transparent when pressed
            }
            return Colors
                .transparent; // Set overlay color to transparent when pressed
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 0), // Set vertical padding
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeColor.fontBlack,
          fontSize: fontSize,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
