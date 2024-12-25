import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:core_dashboard/model/study_materials_model.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'study_materials_event.dart';
part 'study_materials_state.dart';

class StudyMaterialsBloc
    extends Bloc<StudyMaterialsEvent, StudyMaterialsState> {
  StudyMaterialsBloc() : super(StudyMaterialsInitial()) {
    on<StudyMaterialsEvent>(fetchStudyMaterials);
  }

  FutureOr<void> fetchStudyMaterials(
    StudyMaterialsEvent event,
    Emitter<StudyMaterialsState> emit,
  ) async {
    emit(StudyMaterialsLoadingState());
    Uri apiUrl = Uri.parse("${BASE_URL}materials");

    try {
      // Change POST to GET
      final response = await http.get(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Check if the response is a List (JSArray)
        if (responseData is List) {
          List<dynamic> dataList = responseData;
          // If it's a list, you should parse it accordingly.
          List<StudyMaterialsModel> studyMaterialsList = dataList
              .map((item) => StudyMaterialsModel.fromJson(item))
              .toList();

          // You can emit a success state with the list of materials
          emit(StudyMaterialsFetchSucess(studyMaterialsList));
          log("Study materials fetched successfully: $studyMaterialsList");
        } else {
          // If the response is not a list, throw an error or handle accordingly
          emit(StudyMaterialsFetchFailed("Unexpected response format"));
          log("Unexpected response format: $responseData");
        }
      } else {
        final responseData = json.decode(response.body);
        emit(StudyMaterialsFetchFailed("Failed to load materials"));
        log("Failed to fetch study materials. Status code: ${response.statusCode}");
      }
    } catch (e) {
      emit(StudyMaterialsFetchFailed(
          "Failed to get study materials: ${e.toString()}"));
      log("Failed to fetch study materials due to error: ${e.toString()}");
    }
  }
}
