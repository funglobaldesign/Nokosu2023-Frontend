import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Widget w1;
  final Widget w2;
  final Widget w3;

  const BottomBar({
    Key? key,
    required this.w1,
    required this.w2,
    required this.w3,
  }) : super(key: key);

  @override
  BarState createState() => BarState();
}

class BarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 20, bottom: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.w1,
                widget.w2,
                widget.w3,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
