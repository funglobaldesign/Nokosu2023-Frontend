import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class PreviewPage extends StatefulWidget {
  final String imagePath;

  const PreviewPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late Image image;

  @override
  Widget build(BuildContext context) {
    image = Image.file(File(widget.imagePath));
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            Container(
              padding: const EdgeInsets.all(7),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: ThemeColours.bgBlueWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0,
                  color: Colors.transparent,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(-6, -6),
                    color: ThemeColours.shadowDark.withOpacity(0.3),
                  ),
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(6, 6),
                    color: ThemeColours.shadowDark.withOpacity(0.3),
                  )
                ],
              ),
              child: ClipRect(
                child: OverflowBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SizedBox(
                      width: 1,
                      child: image,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Neumo(
                          child: IconButton(
                              color: Colors.red,
                              onPressed: () {
                                RedirectFunctions.redirectHome(context);
                              },
                              icon: const Icon(Icons.close)))),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Neumo(
                      child: IconButton(
                        color: Colors.green,
                        onPressed: () {
                          RedirectFunctions.redirectInfo(context, image);
                        },
                        icon: const Icon(Icons.check),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
