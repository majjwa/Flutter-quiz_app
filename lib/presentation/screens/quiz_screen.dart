import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/core/enums.dart';
import 'package:quiz_app/presentation/controller/question_bloc.dart';
import '../../core/service_locator.dart';
import '../component/quiz_screen_loaded.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<QuestionBloc>()..add(const GetQuestionEvent());
      },
      child: const Scaffold(
        body: QuizScreenContent(),
      ),
    );
  }
}

class QuizScreenContent extends StatelessWidget {
  const QuizScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (BuildContext context, state) {
          switch (state.state) {
            case (QuizState.Loading):
              return Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: Center(
                  child: Lottie.asset('assets/rocket.json'),
                ),
              );
            case (QuizState.Loaded):
              return const QuizScreenLoaded();
            case (QuizState.Error):
              return const Center(
                child: Text("Error"),
              );
          }
        });
  }
}
