import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/domain/entities/quiz.dart';
import '../../core/enums.dart';
import '../../domain/usecases/get_quiz_usecase.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuizUseCase getQuizUseCase;
  QuestionBloc(this.getQuizUseCase) : super(const QuestionState()) {
    on<GetQuestionEvent>(_getQuiz);
  }
  Future<void> _getQuiz(
      GetQuestionEvent event,Emitter<QuestionState>emit)async {
     final result= await getQuizUseCase();
     final Map<int, String> correctAnswers = {};
     result.forEach((quiz) {
       correctAnswers[quiz.id] = quiz.correctAnswer!;
     });
     emit(state.copyWith(
       quiz: result,
       state: QuizState.Loaded,
       correctAnswers: correctAnswers,

     ));

  }


}

