import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'classes_event.dart';
part 'classes_state.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  ClassesBloc() : super(ClassesInitial()) {
    on<ClassesEvent>(_onGetClasses);
    on<ClassPostEvent>(_onPostClasses);
  }

  FutureOr<void> _onGetClasses(
    ClassesEvent event,
    Emitter<ClassesState> emit,
  ) async {
    emit(ClassesLoadingState());

    Uri apiUrl = Uri.parse("${BASE_URL}classes");
    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final classesData = json.decode(response.body);

        emit(ClassesGetSucess(classesData));
        log(response.body, name: "Classes");
      } else {
        final classesData = json.decode(response.body);

        emit(ClassesGetFailure(
            "Failed to get classes data. ${classesData['message']}"));
        log("Failed to get classes data. ${classesData['message']}");
      }
    } catch (e) {
      emit(ClassesGetFailure("Failed to load data. Error: ${e.toString()}"));
      log("Failed to load data. Error: ${e.toString()}");
    }
  }

  FutureOr<void> _onPostClasses(
    ClassPostEvent event,
    Emitter<ClassesState> emit,
  ) async {
    emit(ClassesLoadingState());

    Uri apiUrl = Uri.parse("${BASE_URL}classes");
    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({"name": event.className}),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        emit(ClassPostSucess(responseData));
        log(response.body, name: "Post Success");
      } else {
        final responseData = json.decode(response.body);
        emit(ClassPostFailure(
            "Failed to post class data. ${response.statusCode}"));
        log("Failed to post class data. $responseData");
      }
    } catch (e) {
      emit(ClassPostFailure("Failed to post data. Error: ${e.toString()}"));
      log("Failed to post data. Error: ${e.toString()}");
    }
  }
}
