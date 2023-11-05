part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
  @override
  List<Object?> get props =>[];
}
class GetQuestionEvent extends QuestionEvent{
  const GetQuestionEvent();
}