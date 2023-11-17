import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/utils/constants.dart';

class InfoInputField extends StatefulWidget {
  final String label;
  final double boxWidth;
  final double boxHeight;
  final TextEditingController controller;
  final IconData prefixicon;

  const InfoInputField({
    Key? key,
    required this.label,
    required this.controller,
    required this.prefixicon,
    this.boxWidth = NumericConsts.defBoxWidth,
    this.boxHeight = NumericConsts.defBoxHeight,
  }) : super(key: key);

  @override
  InfoInputFieldState createState() => InfoInputFieldState();
}

class InfoInputFieldState extends State<InfoInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: widget.boxWidth,
            height: widget.boxHeight,
            child: Neumo(
              border: 10,
              child: TextFormField(
                controller: widget.controller,
                style: const TextStyle(color: ThemeColours.txtBlack),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.label,
                  hintStyle: const TextStyle(color: ThemeColours.txtGrey),
                  prefixIcon: Icon(
                    widget.prefixicon,
                    color: ThemeColours.iconBlack,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
