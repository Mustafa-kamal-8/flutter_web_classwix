part of 'study_materials_bloc.dart';

sealed class StudyMaterialsState extends Equatable {
  const StudyMaterialsState();

  @override
  List<Object> get props => [];
}

class StudyMaterialsInitial extends StudyMaterialsState {}

class StudyMaterialsLoadingState extends StudyMaterialsState {}

class StudyMaterialsFetchSucess extends StudyMaterialsState {
  final List<StudyMaterialsModel> studyMaterialsModel;

  const StudyMaterialsFetchSucess(this.studyMaterialsModel);

  @override
  List<Object> get props => [studyMaterialsModel];
}

class StudyMaterialsFetchFailed extends StudyMaterialsState {
  final String error;

  const StudyMaterialsFetchFailed(this.error);

  @override
  List<Object> get props => [error];
}
