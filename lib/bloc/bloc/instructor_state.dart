part of 'instructor_bloc.dart';

abstract class InstructorState extends Equatable {
  const InstructorState();

  @override
  List<Object> get props => [];
}

class InstructorInitial extends InstructorState {}

class InstructorLoadingState extends InstructorState {}

//create
class InstructorCreateSuccess extends InstructorState {
  final dynamic responseData;

  const InstructorCreateSuccess(this.responseData);

  @override
  List<Object> get props => [responseData];
}

class InstructorCreateFailure extends InstructorState {
  final String error;

  const InstructorCreateFailure(this.error);

  @override
  List<Object> get props => [error];
}

//GET
class GetInstructorSuccess extends InstructorState {
  final InstructorModel responseData;

  const GetInstructorSuccess(this.responseData);

  @override
  List<Object> get props => [responseData];
}

class GetInstructorFailure extends InstructorState {
  final String error;

  const GetInstructorFailure(this.error);

  @override
  List<Object> get props => [error];
}

//delete
class DeleteInstructorSuccess extends InstructorState {
  final dynamic responseData;

  const DeleteInstructorSuccess(this.responseData);

  @override
  List<Object> get props => [responseData];
}

class DeleteInstructorFailure extends InstructorState {
  final String error;

  const DeleteInstructorFailure(this.error);

  @override
  List<Object> get props => [error];
}
