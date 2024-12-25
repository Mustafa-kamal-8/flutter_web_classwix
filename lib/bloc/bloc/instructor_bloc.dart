import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:core_dashboard/model/instructor_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'instructor_event.dart';
part 'instructor_state.dart';

class InstructorBloc extends Bloc<InstructorEvent, InstructorState> {
  InstructorBloc() : super(InstructorInitial()) {
    on<CreateInstructorEvent>(createInstructor);
    on<GetInstructorEvent>(getInstructor);
    on<DeleteInstructor>(deleteInstructor);
  }

  Future<void> createInstructor(
    CreateInstructorEvent event,
    Emitter<InstructorState> emit,
  ) async {
    emit(InstructorLoadingState());
    try {
      Uri apiUrl = Uri.parse("${BASE_URL}instructors/assign");
      log("API URL: $apiUrl");

      final response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "user_id": event.userId,
          "course_id": event.courseId,
          "group_id": event.groupId,
        }),
      );

      if (response.statusCode == 201) {
        emit(InstructorCreateSuccess(response.body));
        log("Instructor assigned successfully: ${response.body}");
      } else {
        emit(InstructorCreateFailure(
            "Failed with status: ${response.statusCode}, body: ${response.body}"));
        log("Instructor assignment failed: ${response.body}");
      }
    } catch (e) {
      emit(InstructorCreateFailure(e.toString()));
      log("Error assigning instructor: $e");
    }
  }

  Future<void> getInstructor(
    GetInstructorEvent event,
    Emitter<InstructorState> emit,
  ) async {
    emit(InstructorLoadingState());
    try {
      Uri apiUrl = Uri.parse("${BASE_URL}instructors");
      log("API URL: $apiUrl");

      final response = await http.get(
        apiUrl,
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        InstructorModel instructorModel =
            InstructorModel.fromJson(responseData);

        emit(GetInstructorSuccess(instructorModel));
        log("Instructor retrieved successfully: ${response.body}");
      } else {
        emit(GetInstructorFailure(
            "Failed with status: ${response.statusCode}, body: ${response.body}"));
        log("Failed to retrieve instructor: ${response.body}");
      }
    } catch (e) {
      emit(GetInstructorFailure(e.toString()));
      log("Error retrieving instructor: $e");
    }
  }

  //detele
  Future<void> deleteInstructor(
    DeleteInstructor event,
    Emitter<InstructorState> emit,
  ) async {
    emit(InstructorLoadingState());
    try {
      final String instructorId = event.instructorId;

      // Dynamically create the API URL
      Uri apiUrl = Uri.parse("${BASE_URL}instructors/remove/$instructorId");
      log("API URL: $apiUrl");

      final response = await http.delete(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        emit(DeleteInstructorSuccess(response.body));
        log("Instructor deleted successfully: ${response.body}");
      } else {
        emit(DeleteInstructorFailure(
            "Failed with status: ${response.statusCode}, body: ${response.body}"));
        log("Instructor delete failed: ${response.body}");
      }
    } catch (e) {
      emit(DeleteInstructorFailure(e.toString()));
      log("Error deleting instructor: $e");
    }
  }
}
