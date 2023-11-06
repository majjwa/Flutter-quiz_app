// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quiz_app/core/enums.dart';
// import 'package:quiz_app/presentation/controller/user_data_cubit.dart';
// import 'package:quiz_app/presentation/controller/user_result_cubit.dart';
// import '../controller/question_bloc.dart';
//
// class ResultScreen extends StatelessWidget {
//   const ResultScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final userName = context.read<UserDataCubit>().state;
//     final userResultCubit = context.read<UserResultCubit>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz Result'),
//
//       ),
//       body: BlocBuilder<UserResultCubit, UserResultState>(
//         builder: (BuildContext context, state) {
//           print(state);
//           if (state.state == ResultState.Loaded) {
//             // Use the `getSelectedAnswers` method to retrieve selected answers
//             final selectedAnswers = userResultCubit.getSelectedAnswers();
//             return BlocBuilder<QuestionBloc, QuestionState>(
//               builder: (BuildContext context, questionState) {
//                 if (questionState.state == QuizState.Loaded) {
//                   final quizList = questionState.quiz;
//
//                   int correctCount = 0;
//                   int totalCount = quizList.length;
//                   String getAnswerString(int? selectedOption) {
//                     switch (selectedOption) {
//                       case 1:
//                         return "answer_a";
//                       case 2:
//                         return "answer_b";
//                       case 3:
//                         return "answer_c";
//                       case 4:
//                         return "answer_d";
//                       default:
//                         return '';
//                     }
//                   }
//
//                   for (int questionId = 0; questionId < totalCount; questionId++) {
//                     final selectedAnswer = getAnswerString(
//                         selectedAnswers[questionId]); // Map the selected answer to a string
//                     final correctAnswer = quizList[questionId].correctAnswer;
//
//                     if (selectedAnswer.isNotEmpty &&
//                         selectedAnswer == correctAnswer) {
//                       correctCount++;
//                     } else if (selectedAnswer.isEmpty) {
//                       correctCount--;
//                     }
//                   }
//
//                   double score = (correctCount / totalCount) * 100;
//
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('Hello, $userName!'),
//                         Text(
//                             'You answered $correctCount out of $totalCount questions correctly.'),
//                         Text('Your Score: $score%'),
//                       ],
//                     ),
//                   );
//                 } else if (questionState.state == QuizState.Loading) {
//                   return const CircularProgressIndicator();
//                 } else {
//                   // Handle other states or errors
//                   return const Text('Error loading quiz questions');
//                 }
//               },
//             );
//           } else {
//             // Handle other states or errors
//             return const Text('Error loading user results');
//           }
//         },
//       ),
//     );
//   }
// }
