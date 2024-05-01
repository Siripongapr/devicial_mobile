import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  DialogBox(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(20)});
  final Widget child;

  EdgeInsets? padding;
  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 44),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              padding: widget.padding,
              child: widget.child),
        ],
      ),
    );
  }
}
