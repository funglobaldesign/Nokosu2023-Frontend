import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/Tutorial/page1.dart';
import 'package:nokosu2023/Components/Tutorial/page2.dart';
import 'package:nokosu2023/Components/Tutorial/page3.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);
  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends State<TutorialScreen> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage != 0)
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Icon(Icons.arrow_back),
            ),
          if (currentPage != 2)
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Icon(Icons.arrow_forward),
            ),
          if (currentPage == 2)
            FloatingActionButton(
              onPressed: () {
                RedirectFunctions.redirectHome(context);
              },
              child: Icon(Icons.home),
            ),
        ],
      ),
    );
  }
}
