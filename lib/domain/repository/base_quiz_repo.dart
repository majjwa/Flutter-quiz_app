import 'package:quiz_app/domain/entities/quiz.dart';

abstract class BaseQuizRepo{
  Future<List<Quiz>> getQuiz();
}