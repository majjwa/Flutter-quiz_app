import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/enums.dart';

part 'user_result_state.dart';

class UserResultCubit extends Cubit<UserResultState> {
  UserResultCubit() : super(const UserResultState());

   Map<int, int?> selectedAnswers = {};

  // Method to update the selected answer for a specific question
  void updateSelectedAnswer(int questionId, int? selectedOption)  {
    selectedAnswers[questionId] = selectedOption;
    emit(state.copyWith(
      selectedanswers: selectedAnswers,
      state: ResultState.Loaded,
    ));
  }
}
