import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/button_submit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void login() {
    print('ログインボタンがクリックされました');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null, // タイトルを非表示にする
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ButtonSubmit(text: text, onPressed: onPressed)],
        ),
      ),
    );
  }
}
