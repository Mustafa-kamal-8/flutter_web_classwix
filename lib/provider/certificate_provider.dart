import 'dart:convert';
import 'dart:developer';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CertificateProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int? resStatusCode;

  dynamic _certificateResponse;

  dynamic get certificateResponse => _certificateResponse;

  Future<http.MultipartFile> getThumbnailFile(html.File thumbnail) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(thumbnail);

    await reader.onLoad.first;

    final bytes = reader.result as Uint8List;
    return http.MultipartFile.fromBytes(
      'certificate',
      bytes,
      filename: thumbnail.name,
      contentType: MediaType('image', 'png'),
    );
  }

  Future<void> createCertificate(
    html.File certificate,
    final String description,
    BuildContext context,
  ) async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final token = userData['token'];
    final id = userData['id'];
    final Uri url = Uri.parse("${BASE_URL}users/$id/certificate/upload");

    try {
      final request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          'Accept': 'application/json',
          'Authorization': token,
        })
        ..fields['description'] = description;

      final thumbnailFile = await getThumbnailFile(certificate);
      request.files.add(thumbnailFile);

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = await http.Response.fromStream(response);
        final decodedData = json.decode(responseData.body);
        resStatusCode = response.statusCode;
        log("Certificate created successfully : ${response.statusCode} : ${responseData.body}");

        _certificateResponse = decodedData;
        showSnackBar(
            "Certificate created  successfully", context, Colors.green);
      } else {
        final responseData = await http.Response.fromStream(response);
        final decodedData = json.decode(responseData.body);
        log("Certificate created Response Error : ${response.statusCode} : $decodedData");
      }
    } catch (e) {
      log("Certificate created Error : $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //Get Certificate

  Map<String, dynamic>? _getCertificateResponse;
  Map<String, dynamic>? get getCertificateResponse => _getCertificateResponse;
  Future<void> getCertificate(
    BuildContext context,
  ) async {
    _isLoading = true;
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    final userId = userData['id'];
    final token = userData['token'];
    final Uri url = Uri.parse("${BASE_URL}certificates/$userId");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": token,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        resStatusCode = response.statusCode;
        log("Courses get sucessfully :${response.statusCode} : ${response.body}");

        _getCertificateResponse = responseData;
        // showSnackBar("Course Created Sucessfully", context, Colors.green);
      } else {
        log("Courses get Response Error :${response.statusCode} : ${response.body}");
      }
    } catch (e) {
      log("Courses get Error :$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
// {
//     "id": 1,
//     "user_id": 32,
//     "certificate_path": "certificates/hHQ6C8W2DIHWPqAigv3NNsNuTYmuirN58eFfgdLO.png",
//     "description": "Ai certificate",
//     "created_at": "2024-11-03T16:32:05.000000Z",
//     "updated_at": "2024-11-03T16:32:05.000000Z"
// }