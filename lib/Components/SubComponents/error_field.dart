import 'package:flutter/material.dart';
import 'package:nokosu2023/utils/constants.dart';

class ErrorField extends StatefulWidget {
  final String err;
  final double boxWidth;
  final double boxHeight;

  const ErrorField({
    Key? key,
    required this.err,
    this.boxWidth = NumericConsts.defBoxWidth,
    this.boxHeight = NumericConsts.defBoxHeight / 1.3,
  }) : super(key: key);

  @override
  ErrorFieldState createState() => ErrorFieldState();
}

class ErrorFieldState extends State<ErrorField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
      height: widget.boxHeight,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          widget.err,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ThemeColours.txtRed,
          ),
        ),
      ),
    );
  }
}
