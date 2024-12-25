// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  var _signInRes;
  get signInRes => _signInRes;
  Future<void> forgotPassSendOtp(
    String phone,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();

    final Uri url = Uri.parse("${BASE_URL}resend-otp");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "phone": phone,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _signInRes = json.decode(response.body);
        log(_signInRes?['message']);
        showSnackBar(_signInRes?['message'], context, Colors.green);
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

  dynamic verifyOtpResponse;

  Future<void> verifyPassOtp(
    String phone,
    String otp,
    String password,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();

    final Uri url = Uri.parse("${BASE_URL}reset");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "phone": phone,
          "otp": otp,
          "new_password": password,
          "new_password_confirmation": password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        verifyOtpResponse = json.decode(response.body);
        log(verifyOtpResponse?['message']);
        showSnackBar(verifyOtpResponse?['message'], context, Colors.green);
      } else {
        verifyOtpResponse = json.decode(response.body);
        showSnackBar(verifyOtpResponse?['message'], context, Colors.red);
        log(verifyOtpResponse?['message'], name: "Eror occur during login: ");
      }
    } catch (e) {
      log("Sign in Error: $e ");
      showSnackBar("Please enter valid otp and password", context, Colors.red);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
