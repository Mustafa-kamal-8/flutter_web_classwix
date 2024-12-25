import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/model/courses_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourseProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CoursesModel? _coursesResponse;

  CoursesModel? get courseResponse => _coursesResponse;

  Future<void> getCourses() async {
    _isLoading = true;
    final Uri url = Uri.parse("${BASE_URL}courses");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        _coursesResponse = CoursesModel.fromJson(responseData);
        debugPrint("Courses Response :${response.statusCode} : $responseData");
        log("Courses Response :${response.statusCode} : $_coursesResponse");
      } else {
        log("Courses Response Error :${response.statusCode} : ${response.body}");
      }
    } catch (e) {
      log("Courses Response Error :$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
