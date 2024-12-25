import 'dart:convert';
import 'dart:developer';
import 'package:core_dashboard/model/groups_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GroupsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GroupsModel? _groupsModel;
  GroupsModel? get groupsModel => _groupsModel;

  Future<void> getGroupsData() async {
    final Uri url = Uri.parse("${BASE_URL}groups");
    _isLoading = true;

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        log("Groups fetched successfully: ${response.body}");
        _groupsModel = GroupsModel.fromJson(responseData);
      } else {
        log("Error fetching groups: ${response.body}");
      }
    } catch (e) {
      log("Error fetching groups: ${e.toString()}");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
