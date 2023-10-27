import 'package:flutter/material.dart';

//Button for Login/Registration
class ButtonSubmit extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonSubmit({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(text),
    );
  }
}
