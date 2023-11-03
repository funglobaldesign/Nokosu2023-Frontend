import 'package:flutter/material.dart';
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
  late List<BoxShadow> containerShadowDecoration = [];

  @override
  void initState() {
    super.initState();
    obscureText = widget.ispasswordField;

    containerFocusNode.addListener(() {
      if (containerFocusNode.hasFocus) {
        setState(() {
          containerShadowDecoration.add(
            const BoxShadow(
              color: ThemeColours.shadowInnerDark,
              spreadRadius: -5,
              offset: Offset(-2.5, -2.5),
              blurRadius: 5,
            ),
          );
          containerShadowDecoration.add(
            const BoxShadow(
              color: ThemeColours.shadowInnerLight,
              spreadRadius: -5,
              offset: Offset(2.5, 2.5),
              blurRadius: 5,
            ),
          );
        });
      } else {
        setState(() {
          containerShadowDecoration = [];
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
          Container(
            decoration: BoxDecoration(
              color: ThemeColours.bgBlueWhite,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 0,
                color: Colors.transparent,
              ),
              boxShadow: const [
                BoxShadow(
                  color: ThemeColours.shadowLight,
                  offset: Offset(-5, -5),
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: ThemeColours.shadowDark,
                  offset: Offset(5, 5),
                  blurRadius: 3,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Focus(
                focusNode: containerFocusNode,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
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
