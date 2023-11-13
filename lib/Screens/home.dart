import 'package:flutter/material.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: () => RedirectFunctions.redirectLogin(context),
          child: Text('Login')),
    );
  }
}
