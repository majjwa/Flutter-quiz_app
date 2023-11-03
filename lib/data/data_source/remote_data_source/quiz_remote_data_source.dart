import 'package:dio/dio.dart';
import 'package:quiz_app/core/app_constant.dart';
import 'package:quiz_app/data/model/quiz_model.dart';

import '../../../domain/entities/quiz.dart';

abstract class BaseQuizRemoteDataSource {
  Future<List<Quiz>> getQuiz();
}

class QuizRemoteDataSource extends BaseQuizRemoteDataSource {
  @override
  Future<List<Quiz>> getQuiz() async {
    final response = await Dio().get(AppConstant.quizUrl);
    if (response.statusCode == 200) {
      return List<QuizModel>.from(
          (response.data as List).map((e) => QuizModel.fromJson(e)));
    } else {
      throw Exception();
    }
  }
}
