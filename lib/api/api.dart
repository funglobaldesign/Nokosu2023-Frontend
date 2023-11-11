import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:provider/provider.dart';

void _setProfile(context, json) {
  Provider.of<TokenProvider>(context, listen: false)
      .setToken(json['token'], json['profile']['id']);
  Provider.of<ProfileProvider>(context, listen: false)
      .setModel(Profile.fromJson(json['profile']));
}

Future<int> apiLogin(context, UserLogin data) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

Future<int> apiRegister(context, UserReg data) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APILinks.base}users/register/'));
    // request.files.add(await http.MultipartFile.fromPath('file', 'path/to/file'));
    data.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });
    final response = await request.send();
    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(await response.stream.bytesToString()));
      return 0;
    } else if (response.statusCode == 400) {
      UserRegResponse userres = UserRegResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      Provider.of<FormErrProvider>(context, listen: false).setModel(userres);
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}
