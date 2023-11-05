import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/controller/user_data_cubit.dart';
import 'package:provider/provider.dart'; // Import Provider package
import '../../core/service_locator.dart';
import '../controller/question_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = context.read<UserDataCubit>().state;
    return Provider<QuestionBloc>(
      create: (_) => sl<QuestionBloc>()..add(const GetQuestionEvent()),
      child: Scaffold(
        body: ResultScreenContent(userName: userName),
      ),
    );
  }
}
class ResultScreenContent extends StatelessWidget {
  final String userName;
  const ResultScreenContent({required this.userName});

  String getAnswerString(int selectedOption) {
    switch (selectedOption) {
      case 1:
        return "answer_A";
      case 2:
        return "answer_B";
      case 3:
        return "answer_C";
      case 4:
        return "answer_D";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizList = context.read<QuestionBloc>().state.quiz;
    final selectedAnswers = context.read<QuestionBloc>().state.selectedAnswers;
    int correctCount = 0;
    int totalCount = quizList.length;

    for (int questionIndex = 0; questionIndex < totalCount; questionIndex++) {
      final selectedAnswer = selectedAnswers[questionIndex];
      final correctAnswer = quizList[questionIndex].correctAnswer;
      print("Question $questionIndex - Selected Answer: $selectedAnswer, Correct Answer: $correctAnswer");

      if (selectedAnswer != null && getAnswerString(selectedAnswer) == correctAnswer) {
        correctCount++;
      } else {
        // Handle unanswered questions (you can choose to ignore or consider them as wrong)
        // Example: consider them as wrong
        correctCount--;
      }
    }

    if (correctCount < 0) {
      correctCount = 0; // Ensure it's non-negative
    }

    double score = (correctCount / totalCount) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName),
            Text('Correct Answers: $correctCount / $totalCount'),
          ],
        ),
      ),
    );
  }
}
