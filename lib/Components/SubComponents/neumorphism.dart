import 'package:flutter/material.dart';

class Neumo extends StatefulWidget {
  final Widget widget;

  const Neumo({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  NeumoState createState() => NeumoState();
}

class NeumoState extends State<Neumo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.info),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
