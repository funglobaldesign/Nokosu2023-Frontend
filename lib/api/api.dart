import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/providers/token_provider.dart';

Future<dynamic> apiLogin(UserLogin data) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      TokenProvider.setToken(jsonDecode(response.body)['token']);
      return Profile.fromJson(jsonDecode(response.body)['profile']);
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return 2;
  }
}
