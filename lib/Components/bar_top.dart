import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final Widget w1;
  final Widget w2;
  final Widget w3;

  const TopBar({
    Key? key,
    required this.w1,
    required this.w2,
    required this.w3,
  }) : super(key: key);

  @override
  BarState createState() => BarState();
}

class BarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.125,
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.w1,
                widget.w2,
                widget.w3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
