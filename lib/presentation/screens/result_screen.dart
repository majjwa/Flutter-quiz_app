import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/component/app_bar.dart';
import 'package:quiz_app/presentation/controller/user_data_cubit.dart';
import 'package:quiz_app/presentation/controller/user_result_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  final Map<int, String> correctAnswers;
  ResultScreen({super.key, required this.correctAnswers});
  //  map of integers to answer keys
  final Map<int, String> answerKeyMapping = {
    1: 'answer_a',
    2: 'answer_b',
    3: 'answer_c',
    4: 'answer_d',
  };

  @override
  Widget build(BuildContext context) {
    final userResultCubit = BlocProvider.of<UserResultCubit>(context);
    final userName = context.read<UserDataCubit>().state;

    // Access the selected answers and correct answers here
    final selectedAnswers = userResultCubit.selectedAnswers;
    int totalScore = 0;
    selectedAnswers.forEach((questionId, selectedOption) {
      final correctAnswer = correctAnswers[questionId];
      if (selectedOption != null && correctAnswer != null && correctAnswer.isNotEmpty) {
        final selectedAnswerKey = answerKeyMapping[selectedOption];
        if (selectedAnswerKey == correctAnswer) {
          totalScore++;
        }
      }
    });

    final percentage = (totalScore * 10).toStringAsFixed(0);
    final double progress = totalScore / 10.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 123, 193),
      appBar: const CustomAppBar(backgroundColor: Color.fromARGB(255, 87, 123, 193)),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Congratulations, $userName!"),
              Text(
                'Your Score: $percentage%',
                style: GoogleFonts.abel(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
SizedBox(height: 100,),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Lottie.asset("assets/congrats.json", repeat: true),
                  CircularPercentIndicator(
                    radius: 140.0,
                    lineWidth: 14.0,
                    percent: progress, // The value from 0.0 to 1.0
                    animation: true, // Enable animation
                    animationDuration: 1000, // Duration of the animation in milliseconds
                    // center: Text(
                    //   '$percentage%',
                    //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    // ),
                    circularStrokeCap: CircularStrokeCap.round, // Rounded line ends
                    backgroundColor: Colors.white.withOpacity(0.3),
                    progressColor: Colors.red, // Change color here
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
