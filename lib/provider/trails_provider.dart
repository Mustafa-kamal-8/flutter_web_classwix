import 'dart:convert';
import 'dart:developer';

import 'package:core_dashboard/model/trial_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrailsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  TrialModel? _trialModel;

  TrialModel? get trailModel => _trialModel;

  Future<void> getTrails(dynamic courseId) async {
    _isLoading = true;

    final Uri url = Uri.parse("${BASE_URL}trials/$courseId/users");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _trialModel = TrialModel.fromJson(responseData);
        log("Trail get sucessfully: $url :  $responseData");
      } else {
        final responseData = json.decode(response.body);
        log("Error getting trail: $responseData");
      }
    } catch (e) {
      log(e.toString(), name: "Error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createTrails(dynamic courseId) async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final uid = userData['id'];
    final token = userData['token'];

    final Uri url = Uri.parse("${BASE_URL}trials/$courseId/start");

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
            'user_id': uid,
            'course_id': courseId,
            'is_active': true,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);

        log("Trail create sucessfully: $url :  $responseData");
      } else {
        final responseData = json.decode(response.body);
        log("Error creating trail: $responseData");
      }
    } catch (e) {
      log(e.toString(), name: "Error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //set Links
  dynamic setLinkResponse;
  Future<void> setTrailLink(
    dynamic courseId,
    String trailLink,
    String description,
    BuildContext context,
  ) async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final uid = userData['id'];
    final token = userData['token'];

    final Uri url = Uri.parse("${BASE_URL}trials/$courseId/user/$uid/set-link");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": token,
        },
        body: json.encode({
          "trial_link": trailLink,
          "description": description,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);

        log("Trail Link create sucessfully: $url :  $responseData");
      } else {
        final responseData = json.decode(response.body);
        showSnackBar(responseData['message'], context, Colors.red);
        setLinkResponse = response.statusCode;
        log("Error creating trail Link:${response.statusCode} $responseData");
      }
    } catch (e) {
      log(e.toString(), name: "Error set Link");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //get trails

  TrailsLinkModel? _trialLinkModel;
  TrailsLinkModel? get trailLinkModel => _trialLinkModel;

  dynamic trailLinkError;
  Future<void> getTrailLink(
    dynamic courseId,
    BuildContext context,
  ) async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final uid = userData['id'];
    final token = userData['token'];

    final Uri url = Uri.parse("${BASE_URL}trials/$courseId/user/$uid/get-link");

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
        final responseData = json.decode(response.body);
        _trialLinkModel = TrailsLinkModel.fromJson(responseData);
        log("Trail get sucessfully: $url :  $responseData");
      } else {
        final responseData = json.decode(response.body);
        trailLinkError = response.statusCode;
        showSnackBar(responseData['message'], context, Colors.red);
        log("Error getting trail Link: ${response.statusCode}: $responseData");
      }
    } catch (e) {
      log(e.toString(), name: "Error get Link");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
