import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:nokosu2023/utils/constants.dart';

class Neumo extends StatefulWidget {
  final Widget child;
  final double border;

  const Neumo({
    Key? key,
    required this.child,
    this.border = 100,
  }) : super(key: key);

  @override
  NeumoState createState() => NeumoState();
}

class NeumoState extends State<Neumo> {
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
    return Focus(
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
            borderRadius: BorderRadius.circular(widget.border),
            border: Border.all(
              width: 0,
              color: Colors.transparent,
            ),
            boxShadow: containerShadowDecoration,
          ),
          child: widget.child),
    );
  }
}
