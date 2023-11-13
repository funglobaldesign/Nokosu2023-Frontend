import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:provider/provider.dart';

// Private utility functions
void _setProfile(context, json) {
  Provider.of<TokenProvider>(context, listen: false)
      .setToken(json['token'], json['profile']['id']);
  Provider.of<ProfileProvider>(context, listen: false)
      .setModel(Profile.fromJson(json['profile']));
}

// User
Future<int> apiRegister(context, UserReg data) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APILinks.base}users/register/'));
    data.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });
    final response = await request.send();
    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(await response.stream.bytesToString()));
      Provider.of<FormErrProvider>(context, listen: false)
          .setModel(UserRegResponse());
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

Future<int> apiLogout(context) async {
  try {
    String token = Provider.of<TokenProvider>(context, listen: false).token;

    final response = await http.post(
      Uri.parse('${APILinks.base}users/logout/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );

    if (response.statusCode == 200) {
      Provider.of<TokenProvider>(context, listen: false).setToken("", 0);
      return 0;
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

// Profile
// apiGetProfiles : Not required atm

Future<int> apiGetProfile(context, int id) async {
  try {
    String token = Provider.of<TokenProvider>(context, listen: false).token;

    final response = await http.get(Uri.parse('${APILinks.base}profiles/$id/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        });

    if (response.statusCode == 200) {
      return 0;
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

Future<int> apiUpdateProfile(context, UserReg data, String file) async {
  try {
    int id = Provider.of<TokenProvider>(context, listen: false).id;
    String token = Provider.of<TokenProvider>(context, listen: false).token;
    var request = http.MultipartRequest(
        'PUT', Uri.parse('${APILinks.base}profiles/$id/'));

    data.toJson().forEach((key, value) {
      if (key != 'password1' &&
          key != 'password2' &&
          value != null &&
          value.isNotEmpty) {
        request.fields[key] = value.toString();
      }
    });
    request.headers['Authorization'] = 'Token $token';
    request.files.add(await http.MultipartFile.fromPath('photo', file));

    final response = await request.send();

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(await response.stream.bytesToString()));
      Provider.of<FormErrProvider>(context, listen: false)
          .setModel(UserRegResponse());
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

  // apiDelProfile
  

// Group
  // apiGetGroups

  // apiAddGroups

  // apiGetGroup

  // apiUpdateGroup

  // apiDelGroup

// Info
  // apiGetInfos

  // apiAddInfos

  // apiGetInfo

  // apiUpdateInfo

  // apiDelInfo

// Email
  // apiGetMail

  // apiUpdatePw