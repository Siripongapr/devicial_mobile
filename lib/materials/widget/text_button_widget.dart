import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key, required this.onPressed});
  final void Function()? onPressed;
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
      ),
      child: const Text(
        'create an account',
        style: TextStyle(
          color: ThemeColor.fontBlack,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
