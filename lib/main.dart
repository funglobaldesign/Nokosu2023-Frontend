import 'package:flutter/material.dart';
import 'package:nokosu2023/Screens/login.dart';

void main() {
  runApp(const Nokosu());
}

class Nokosu extends StatelessWidget {
  const Nokosu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color themeColour = Colors.deepPurple;

    return MaterialApp(
      title: 'Nokosu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColour),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
