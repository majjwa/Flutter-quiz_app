part of 'question_bloc.dart';

class QuestionState extends Equatable {
  final List<Quiz> quiz;
  final QuizState state;
  final Map<int, int> selectedAnswers;

  const QuestionState({
    this.quiz = const [],
    this.state = QuizState.Loading,
    this.selectedAnswers= const{},
  });

  QuestionState copyWith({
    List<Quiz>? quiz,
    QuizState? state,
    Map<int, int>? selectedAnswers,
  }) {
    return QuestionState(
      quiz: quiz ?? this.quiz,
      state: state ?? this.state,
      selectedAnswers: selectedAnswers?? this.selectedAnswers,
    );
  }

  @override
  List<Object> get props => [quiz, state,selectedAnswers];
}
