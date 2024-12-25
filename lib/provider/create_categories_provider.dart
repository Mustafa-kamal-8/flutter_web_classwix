import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/model/course_categories_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateCategoriesProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int? resStatusCode;

  dynamic _coursesResponse;

  dynamic get courseResponse => _coursesResponse;

  Future<void> createCoursesCategories(
    String title,
    String slug,
    int icon,
    int thumbnail,
    String parentId,
    int status,
    bool isPopular,
  ) async {
    _isLoading = true;
    // notifyListeners();
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final userId = userData['id'];
    final token = userData['token'];
    final Uri url = Uri.parse("${BASE_URL}categories");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": token,
        },
        body: json.encode(
          {
            "title": title,
            "slug": slug,
            "icon": icon,
            "thumbnail": thumbnail,
            "parent_id": parentId,
            "user_id": userId,
            "status_id": status,
            "is_popular": isPopular,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        resStatusCode = response.statusCode;
        log("Create Courses categories Response :${response.statusCode} : ${response.body}");

        _coursesResponse = responseData;
      } else {
        log("Create Courses categories Response Error :${response.statusCode} : ${response.body}");
      }
    } catch (e) {
      log("Create Courses categories Response Error :$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

// Courses Categories

  // CourseCategoriesModel? _courseCategoriesModel;
  // CourseCategoriesModel? get courseCategoriesModel => _courseCategoriesModel;

  // Future<CourseCategoriesModel?> getCoursesCategories() async {
  //   _isLoading = true;
  //   Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
  //   final token = userData['token'];
  //   final Uri url = Uri.parse("${BASE_URL}categories");

  //   try {
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         "Authorization": token,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);

  //       _courseCategoriesModel = CourseCategoriesModel.fromJson(responseData);
  //       log("Course Categories: ${response.statusCode} : ${response.body}");
  //       return _courseCategoriesModel;
  //     } else {
  //       log("Course Categories error: ${response.statusCode} : ${response.body}");
  //       return null;
  //     }
  //   } catch (e) {
  //     log("Course Categories Error :$e");
  //     return null;
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
  List<CourseCategoriesModel>? _courseCategoriesModel;
  List<CourseCategoriesModel>? get courseCategoriesModel =>
      _courseCategoriesModel;

  List<CourseCategoriesModel>? _filteredCategories = [];
  List<CourseCategoriesModel>? get filteredCategories => _filteredCategories;

  String _searchQuery = '';
  void setSearchQuery(String query) {
    _searchQuery = query;
    _filterCategories();
  }

  void _filterCategories() {
    if (_searchQuery.isEmpty) {
      _filteredCategories = _courseCategoriesModel;
    } else {
      _filteredCategories = _courseCategoriesModel?.where((category) {
        return category.title
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  Future<List<CourseCategoriesModel>?> getCoursesCategories() async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final token = userData['token'];
    final Uri url = Uri.parse("${BASE_URL}categories");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": token,
        },
      );

      if (response.statusCode == 200) {
        final responseData =
            json.decode(response.body) as List<dynamic>; // Parse as List

        // Use the fromJsonList method to convert to a List of CourseCategoriesModel
        _courseCategoriesModel =
            CourseCategoriesModel.fromJsonList(responseData);
        _filteredCategories = _courseCategoriesModel;
        log("Course Categories: ${response.statusCode} : ${response.body}");
        return _courseCategoriesModel; // Return the list of categories
      } else {
        log("Course Categories error: ${response.statusCode} : ${response.body}");
        return null;
      }
    } catch (e) {
      log("Course Categories Error :$e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
