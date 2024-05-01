import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class NewPostButton extends StatelessWidget {
  NewPostButton(
      {super.key,
      this.onPressed,
      this.text = 'New post +',
      this.heroTag,
      this.cancel = false});
  Function()? onPressed;
  Object? heroTag;
  String text;
  bool cancel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: 113,
        height: 31,
        child: FloatingActionButton(
          elevation: 0,
          heroTag: heroTag,
          backgroundColor: cancel ? ThemeColor.buttonCancel : ThemeColor.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: cancel ? ThemeColor.fontBlack : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
