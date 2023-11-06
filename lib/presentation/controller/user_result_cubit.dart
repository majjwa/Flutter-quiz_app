import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/enums.dart';

part 'user_result_state.dart';

class UserResultCubit extends Cubit<UserResultState> {
  UserResultCubit() : super(UserResultState());

   Map<int, int?> selectedAnswers = {};

  // Method to update the selected answer for a specific question
  Future<void> updateSelectedAnswer(int questionId, int? selectedOption) async{
    selectedAnswers[questionId] = await selectedOption;
    emit(state.copyWith(
      selectedanswers:selectedAnswers,
      state: ResultState.Loaded,
    ));

  }

  //
  // // Method to retrieve the selected answers
  // Map<int, int?> getSelectedAnswers() {
  //   return state.selectedanswers;
  // }
}
