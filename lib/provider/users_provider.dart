import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/model/user_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UsersModel? _userModel;

  UsersModel? get userModel => _userModel;

  Future<void> getUsers() async {
    Uri apiUrl = Uri.parse("${BASE_URL}users");
    _isLoading = true;

    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _userModel = UsersModel.fromJson(responseData);

        log("User retrive sucessfully: $responseData");
      } else {
        final responseData = json.decode(response.body);
        log("User retrive sucessfully: ${response.statusCode} :  $responseData");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //DELETE USERS
  Future<void> deleteUsers(var userId, BuildContext context) async {
    Uri apiUrl = Uri.parse("${BASE_URL}users/$userId");
    _isLoading =
        true; // Assuming _isLoading is declared and used with ChangeNotifier

    try {
      final response = await http.delete(apiUrl); // Use DELETE method
      if (response.statusCode == 200 || response.statusCode == 204) {
        log("User deleted successfully");
        showSnackBar("User deleted successfully", context, Colors.green);
        Navigator.pop(context);
      } else {
        // Handle non-success status codes
        log("User delete failed: ${response.statusCode}");
        try {
          final responseData = json.decode(response.body);
          log("Response: $responseData");
        } catch (e) {
          log("Response is not JSON: ${response.body}");
        }
        showSnackBar(
          "Failed to delete user: ${response.statusCode}",
          context,
          Colors.red,
        );
      }
    } catch (e) {
      log("Error: $e");
      showSnackBar("An error occurred: $e", context, Colors.red);
    } finally {
      _isLoading = false;
      notifyListeners(); // Update UI if using state management
    }
  }
}
