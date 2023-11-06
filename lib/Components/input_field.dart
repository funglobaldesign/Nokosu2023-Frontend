import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:nokosu2023/src/constants.dart';

class InputField extends StatefulWidget {
  final String label;
  final String err;
  final double boxWidth;
  final TextEditingController controller;
  final bool ispasswordField;
  final IconData prefixicon;

  const InputField({
    Key? key,
    required this.label,
    required this.controller,
    required this.prefixicon,
    this.boxWidth = 250,
    this.err = '',
    this.ispasswordField = false,
  }) : super(key: key);

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  late bool obscureText;
  final FocusNode containerFocusNode = FocusNode();
  late List<BoxShadow> containerShadowDecoration = [
    const BoxShadow(
      blurRadius: 6,
      offset: Offset(-6, -6),
      color: ThemeColours.shadowLight,
    ),
    const BoxShadow(
      blurRadius: 6,
      offset: Offset(6, 6),
      color: ThemeColours.shadowDark,
    ),
  ];

  @override
  void initState() {
    super.initState();
    obscureText = widget.ispasswordField;

    containerFocusNode.addListener(() {
      if (containerFocusNode.hasFocus) {
        setState(() {
          containerShadowDecoration.add(
            const BoxShadow(
                blurRadius: 6,
                offset: Offset(-6, -6),
                color: ThemeColours.shadowLight,
                inset: true),
          );
          containerShadowDecoration.add(const BoxShadow(
              blurRadius: 5,
              offset: Offset(5, 5),
              color: ThemeColours.shadowDark,
              inset: true));
        });
      } else {
        setState(() {
          containerShadowDecoration.removeLast();
          containerShadowDecoration.removeLast();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            focusNode: containerFocusNode,
            child: Container(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 0,
                left: 15,
                right: 15,
              ),
              decoration: BoxDecoration(
                color: ThemeColours.bgBlueWhite,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 0,
                  color: Colors.transparent,
                ),
                boxShadow: containerShadowDecoration,
              ),
              child: TextFormField(
                controller: widget.controller,
                obscureText: obscureText,
                style: const TextStyle(color: ThemeColours.txtBlack),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.label,
                  hintStyle: const TextStyle(color: ThemeColours.txtGrey),
                  prefixIcon: Icon(
                    widget.prefixicon,
                    color: ThemeColours.iconBlack,
                  ),
                  suffixIcon: widget.ispasswordField
                      ? IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ThemeColours.iconBlack,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
          Text(
            widget.err,
            style: const TextStyle(color: ThemeColours.txtRed),
          ),
        ],
      ),
    );
  }
}
