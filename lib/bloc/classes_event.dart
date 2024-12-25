part of 'classes_bloc.dart';

abstract class ClassesEvent extends Equatable {
  const ClassesEvent();

  @override
  List<Object?> get props => [];
}

class FetchClassesEvent extends ClassesEvent {}

//Class post

class ClassPostEvent extends ClassesEvent {
  final String className;

  const ClassPostEvent(this.className);

  @override
  List<Object?> get props => [className];
}
