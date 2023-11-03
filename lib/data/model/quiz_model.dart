import 'package:quiz_app/data/model/answers_model.dart';
import 'package:quiz_app/domain/entities/quiz.dart';

class QuizModel extends Quiz {
  const QuizModel({
    required super.id,
    required super.question,
    required super.answers,
    required super.correctAnswer,
  });
  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'],
        question: json['question'],
        answers: AnswersModel.fromMap(json['answers']),
        correctAnswer: json['correct_answer']?? '',
      );
}
