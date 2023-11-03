import 'package:quiz_app/domain/entities/answers.dart';

class AnswersModel extends Answers {
  const AnswersModel({
    required super.answerA,
    required super.answerB,
    required super.answerC,
    required super.answerD,
  });
  factory AnswersModel.fromMap(Map<String, dynamic> json) => AnswersModel(
        answerA: json['answer_a'],
        answerB: json['answer_b'],
        answerC: json['answer_c'],
        answerD: json['answer_d'],
      );
}
