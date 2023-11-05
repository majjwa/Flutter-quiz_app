import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/enums.dart';
import 'package:quiz_app/presentation/controller/question_bloc.dart';
import '../../core/service_locator.dart';
import '../component/quiz_screen_loaded.dart';
import '../controller/user_data_cubit.dart';

class QuizScreen extends StatelessWidget {

  const QuizScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<QuestionBloc>()..add(const GetQuestionEvent());
      },
      child: const Scaffold(
        body: QuizScreenContant(),
      ),
    );
  }
}

class QuizScreenContant extends StatelessWidget {
  const QuizScreenContant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (BuildContext context, state) {
          switch(state.state){
            case(QuizState.Loading):
              return const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 87, 123, 193),));
            case(QuizState.Loaded):
              return const QuizScreenLoaded();
            case(QuizState.Error):
              return Container();
          }


    });
  }
}
