import 'package:equatable/equatable.dart';
import 'package:quiz_app/domain/entities/answers.dart';

class Quiz extends Equatable {
  final int id;
  final String question;
  final Answers answers;
  final String correctAnswer;

  const Quiz(
      {required this.id,
      required this.question,
      required this.answers,
      required this.correctAnswer});

  @override
  List<Object?> get props => [id, question, answers, correctAnswer];
}
