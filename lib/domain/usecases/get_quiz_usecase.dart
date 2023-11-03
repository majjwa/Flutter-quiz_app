import 'package:quiz_app/domain/entities/quiz.dart';
import 'package:quiz_app/domain/repository/base_quiz_repo.dart';

class GetQuizUseCase {
  final BaseQuizRepo baseQuizRepo;
  GetQuizUseCase(this.baseQuizRepo);

  Future<List<Quiz>> call() async {
    return await baseQuizRepo.getQuiz();
  }
}
