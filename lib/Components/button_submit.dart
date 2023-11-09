import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/utils/constants.dart';

//Button for Login/Registration submit
class ButtonSubmit extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double boxWidth;
  final double boxHeight;

  const ButtonSubmit({
    Key? key,
    required this.text,
    required this.onPressed,
    this.boxWidth = NumericConsts.defBoxWidth,
    this.boxHeight = NumericConsts.defBoxHeight,
  }) : super(key: key);

  @override
  ButtomSubmitState createState() => ButtomSubmitState();
}

class ButtomSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
      height: widget.boxHeight,
      child: Neumo(
        child: InkWell(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ThemeColours.txtBlack,
              ),
            ),
          ),
          onTap: () {
            widget.onPressed();
          },
        ),
      ),
    );
  }
}
