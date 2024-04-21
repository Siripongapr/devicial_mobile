import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class NewPostButton extends StatelessWidget {
  const NewPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: 113,
        height: 31,
        child: FloatingActionButton(
          backgroundColor: ThemeColor.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set border radius
            // You can also use other shapes like StadiumBorder, CircleBorder, etc.
          ),
          onPressed: () {
            // Add your action here
            print('Floating button pressed');
          },
          child: Text(
            'New post +',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
