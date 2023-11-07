part of 'question_bloc.dart';

class QuestionState extends Equatable {
  final List<Quiz> quiz;
  final QuizState state;
  final Map<int, String> correctAnswers;

  const QuestionState({
    this.quiz = const [],
    this.state = QuizState.Loading,
    this.correctAnswers = const {},
  });

  QuestionState copyWith({
    List<Quiz>? quiz,
    QuizState? state,
    Map<int,String>? correctAnswers,
  }) {
    return QuestionState(
      quiz: quiz ?? this.quiz,
      state: state ?? this.state,
      correctAnswers: correctAnswers?? this.correctAnswers,
    );
  }

  @override
  List<Object> get props => [quiz, state,correctAnswers];
}
