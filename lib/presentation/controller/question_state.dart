part of 'question_bloc.dart';

class QuestionState extends Equatable {
  final List<Quiz> quiz;
  final QuizState state;

  const QuestionState({
    this.quiz = const [],
    this.state = QuizState.Loading,
  });

  QuestionState copyWith({
    List<Quiz>? quiz,
    QuizState? state,
  }) {
    return QuestionState(
      quiz: quiz ?? this.quiz,
      state: state ?? this.state,
    );
  }

  @override
  List<Object> get props => [quiz, state];
}
