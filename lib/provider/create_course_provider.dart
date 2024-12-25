import 'dart:convert';
import 'dart:developer';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CreateCourseProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int? resStatusCode;

  dynamic _coursesResponse;

  dynamic get courseResponse => _coursesResponse;

  Future<http.MultipartFile> getThumbnailFile(html.File thumbnail) async {
    // Create a Blob from the file and convert it to a ByteStream
    final reader = html.FileReader();
    reader.readAsArrayBuffer(thumbnail);

    // Wait for the reader to load the file
    await reader.onLoad.first;

    // Create a MultipartFile from the ByteStream
    final bytes = reader.result as Uint8List;
    return http.MultipartFile.fromBytes(
      'thumbnail',
      bytes,
      filename: thumbnail.name,
      contentType: MediaType('image', 'png'),
    );
  }

  Future<void> createCourses(
    String title,
    String slug,
    String description,
    // String shortDescription,
    html.File thumbnail, // Change to html.File for web compatibility
    String classesId,
    // String instructorID,
    String courseCateId,
    BuildContext context,
  ) async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final token = userData['token'];
    final Uri url = Uri.parse("${BASE_URL}courses");

    try {
      final request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          'Accept': 'application/json',
          'Authorization': token,
        })
        ..fields['title'] = title
        ..fields['slug'] = slug
        ..fields['description'] = description
        ..fields['course_category_id'] = courseCateId
        // ..fields['instructor_id'] = instructorID
        // ..fields['short_description'] = shortDescription
        ..fields['classes_id'] = classesId;

      // Use the updated getThumbnailFile function for web
      final thumbnailFile = await getThumbnailFile(thumbnail);
      request.files.add(thumbnailFile);

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = await http.Response.fromStream(response);
        final decodedData = json.decode(responseData.body);
        resStatusCode = response.statusCode;
        log("Courses created Response : ${response.statusCode} : ${responseData.body}");

        _coursesResponse = decodedData;
        showSnackBar("Course Created Successfully", context, Colors.green);
      } else {
        final responseData = await http.Response.fromStream(response);
        final decodedData = json.decode(responseData.body);
        log("Courses created Response Error : ${response.statusCode} : $decodedData");
      }
    } catch (e) {
      log("Courses created Error : $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> createCourses(
  //   String title,
  //   String slug,
  //   String description,
  //   String shortDescription,
  //   // String thumbnail,
  //   BuildContext context,
  // ) async {
  //   _isLoading = true;
  //   Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
  //   // final userId = userData['id'];
  //   final token = userData['token'];
  //   final Uri url = Uri.parse("${BASE_URL}courses");

  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         "Authorization": token,
  //       },
  //       body: json.encode({
  //         "title": title,
  //         "slug": slug,
  //         "description": description,
  //         "course_category_id": 3,
  //         "instructor_id": 1,
  //         "thumbnail": "assets/images/illustration/dummy-customer.png",
  //         "short_description": shortDescription,
  //       }),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final responseData = json.decode(response.body);
  //       resStatusCode = response.statusCode;
  //       log("Courses created Response :${response.statusCode} : ${response.body}");

  //       _coursesResponse = responseData;
  //       showSnackBar("Course Created Sucessfully", context, Colors.green);
  //     } else {
  //       log("Courses created Response Error :${response.statusCode} : ${response.body}");
  //     }
  //   } catch (e) {
  //     log("Courses created Error :$e");
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
