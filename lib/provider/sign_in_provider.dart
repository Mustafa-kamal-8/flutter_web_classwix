// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _signInRes;
  Map<String, dynamic>? get signInRes => _signInRes;

  Future<void> signIn(
    String phone,
    String password,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();

    final Uri url = Uri.parse("${BASE_URL}signin");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "phone": phone,
            "password": password,
            "password_confirmation": password
          },
        ),
      );

      if (response.statusCode == 200) {
        _signInRes = json.decode(response.body);
        log(_signInRes?['message']);
        showSnackBar(_signInRes?['message'], context, Colors.green);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        await prefs.setBool('isLoggedIn', true);
        final userData = _signInRes!['user'];
        await UserDataManager.saveLoginInfo(
          _signInRes!['token'],
          userData['id'].toString(),
          userData['name'],
          userData['phone'],
        );
      } else {
        _signInRes = json.decode(response.body);
        showSnackBar(_signInRes?['message'], context, Colors.red);
        log(_signInRes?['message'], name: "Eror occur during login: ");
      }
    } catch (e) {
      log("Sign in Error: $e ");
      showSnackBar(e.toString(), context, Colors.red);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
