part of 'classes_bloc.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object?> get props => [];
}

class ClassesInitial extends ClassesState {}

class ClassesLoadingState extends ClassesState {}

class ClassesGetSucess extends ClassesState {
  final List<dynamic> reponseData;

  const ClassesGetSucess(this.reponseData);

  @override
  List<Object?> get props => [reponseData];
}

class ClassesGetFailure extends ClassesState {
  final String error;

  const ClassesGetFailure(this.error);

  @override
  List<Object?> get props => [error];
}

//Class Post

class ClassPostSucess extends ClassesState {
  final dynamic className;

  const ClassPostSucess(this.className);

  @override
  List<Object?> get props => [className];
}

class ClassPostFailure extends ClassesState {
  final String error;

  const ClassPostFailure(this.error);

  @override
  List<Object?> get props => [error];
}
