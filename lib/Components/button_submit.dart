import 'package:flutter/material.dart';

//Button for Login/Registration submit
class ButtonSubmit extends StatefulWidget {
  final String text;
  final Function onPressed;

  const ButtonSubmit({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  ButtomSubmitState createState() => ButtomSubmitState();
}

class ButtomSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        child: Text(widget.text),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
