import 'package:quiz_app/data/data_source/remote_data_source/quiz_remote_data_source.dart';
import 'package:quiz_app/domain/entities/quiz.dart';
import 'package:quiz_app/domain/repository/base_quiz_repo.dart';

class QuizRepo extends BaseQuizRepo {
  final BaseQuizRemoteDataSource baseQuizRemoteDataSource;
  QuizRepo(this.baseQuizRemoteDataSource);
  @override
  Future<List<Quiz>> getQuiz() async {
    final result = await baseQuizRemoteDataSource.getQuiz();

    return result;
  }
}
