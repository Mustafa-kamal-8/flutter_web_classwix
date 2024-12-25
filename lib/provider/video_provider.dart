// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:core_dashboard/model/video_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class VideosUploadProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<http.MultipartFile> getFileFromHtml(
      html.File file, String fieldName) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);

    await reader.onLoad.first;

    final bytes = reader.result as Uint8List;
    return http.MultipartFile.fromBytes(
      fieldName,
      bytes,
      filename: file.name,
      contentType: MediaType('video', file.type.split('/').last),
    );
  }

  Future<void> uploadVideo(
    BuildContext context, {
    required String groupId,
    required String title,
    // required html.File? videoFile,
    required int? playLimit,
    required int courseId,
    required String videoLink,
  }) async {
    _isLoading = true;
    notifyListeners();

    final uri = Uri.parse("${BASE_URL}videos");
    final request = http.MultipartRequest('POST', uri);
    log('Raw request: ${request.fields} : Files :  ${request.files}');

    try {
      // Add form data fields
      request.fields['group_id'] = groupId;
      request.fields['title'] = title;
      request.fields['play_limit'] = playLimit.toString();
      request.fields['course_id'] = courseId.toString();
      request.fields['video_link'] = videoLink;

      // Validate and attach the video file
      // if (videoFile != null) {
      //   final videoMultipart =
      //       await getFileFromHtml(videoFile, 'video'); // Correct field name
      //   request.files.add(videoMultipart);
      // } else {
      //   throw Exception("Video file is required.");
      // }

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      log('Raw Response: ${responseData.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Video uploaded successfully: ${response.reasonPhrase}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Video uploaded successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        final decodedData = json.decode(responseData.body);
        log('Failed to upload video: ${response.statusCode}');
        log('Failed to upload video decodedData: $decodedData');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to upload video: ${decodedData['message']}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      log('Error during video upload: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error uploading video: $e"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //get videos

  List<VideoModel>? _videoModel;
  List<VideoModel>? get videoModel => _videoModel;

  Future<void> getVideos(dynamic groupId) async {
    final Uri url = Uri.parse("${BASE_URL}courses/$groupId/videos");

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        _videoModel =
            responseData.map((data) => VideoModel.fromJson(data)).toList();
        log(responseData.toString(), name: "Video get sucessfully");

        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        log('Failed to load videos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      log('Error during video fetch: $e');
    }
  }
}
