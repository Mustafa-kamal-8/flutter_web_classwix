part of 'instructor_bloc.dart';

abstract class InstructorEvent extends Equatable {
  const InstructorEvent();

  @override
  List<Object> get props => [];
}

class CreateInstructorEvent extends InstructorEvent {
  final dynamic userId;
  final dynamic courseId;
  final dynamic groupId;

  const CreateInstructorEvent(this.userId, this.courseId, this.groupId);

  @override
  List<Object> get props => [userId, courseId, groupId];
}

class GetInstructorEvent extends InstructorEvent {}

//delete instructor

class DeleteInstructor extends InstructorEvent {
  final String instructorId;

  const DeleteInstructor(this.instructorId);

  @override
  List<Object> get props => [instructorId];
}
