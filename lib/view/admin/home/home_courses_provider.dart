import 'package:core_dashboard/view/admin/home/model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:http/http.dart' as http;

class HomeCoursesProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<CourseCategory>? _courseCategoriesModel;
  List<CourseCategory>? get courseCategoriesModel => _courseCategoriesModel;

  Future<List<CourseCategory>?> getCourses() async {
    _isLoading = true;

    // Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    // final token = userData['token'];
    final Uri url = Uri.parse("${BASE_URL}home");

    // if (token == null) {
    //   log("Authorization token is missing");
    //   _isLoading = false;
    //   notifyListeners();
    //   return null;
    // }

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // "Authorization": token,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        // Ensure fromJsonList correctly parses the JSON list into CourseCategory objects
        _courseCategoriesModel = CourseCategory.fromJsonList(responseData);
        log("Courses: ${response.statusCode} : ${response.body}");
        return _courseCategoriesModel;
      } else {
        log("Courses: ${response.statusCode} : ${response.body}");
        return null;
      }
    } catch (e) {
      log("Course Error: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
