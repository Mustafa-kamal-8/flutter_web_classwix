import 'dart:convert';
import 'dart:developer';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/models/workshok_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorkshopProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<WorkshopModel> _workshopResponse = [];
  List<WorkshopModel> get workshopResponse => _workshopResponse;

  String? _error; // To store any error messages
  String? get error => _error;

  Future<void> getWorkshop() async {
    _isLoading = true;
    _error = null; // Reset error message before fetching
    // notifyListeners(); // Notify listeners immediately to reflect loading state

    final Uri url = Uri.parse("${BASE_URL}workshops");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Check if the response is a list of workshops
        if (responseData is List) {
          _workshopResponse =
              responseData.map((item) => WorkshopModel.fromJson(item)).toList();
        } else {
          // If it returns a single workshop (which is unlikely based on the error)
          _workshopResponse = [WorkshopModel.fromJson(responseData)];
        }

        log("Workshop Response: ${response.statusCode} : $responseData");
      } else {
        _error = "Error: ${response.statusCode} - ${response.body}";
        log("Workshop Response Error: $_error");
      }
    } catch (e) {
      _error = "Error: $e";
      log("Workshop Response Error: $_error");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners after loading completes
    }
  }

  Future<void> createWorkshop(
    String title,
    String description,
    String link,
    BuildContext context,
  ) async {
    _isLoading = true;

    final Uri url = Uri.parse("${BASE_URL}workshops");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            "title": title,
            "description": description,
            "link": link,
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseData = json.decode(response.body);

        log("Workshop Created Successfully: ${response.statusCode} : $responseData");
        showSnackBar("Workshop Created Successfully", context, Colors.green);
      } else {
        log("Error: ${response.statusCode} - ${response.body}");
        showSnackBar("Something went wrong, please try again.", context,
            Colors.red); // Error color is red
      }
    } catch (e) {
      log("Workshop Response Error: $e");
      showSnackBar("Network error occurred, please try again.", context,
          Colors.red); // Show error snackbar on failure
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners after loading completes
    }
  }
}
