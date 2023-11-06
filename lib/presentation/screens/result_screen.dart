import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/app_bar.dart';
import '../controller/question_bloc.dart';
import '../controller/user_result_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userResultCubit = context.read<UserResultCubit>();
    return BlocBuilder<QuestionBloc, QuestionState>(
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 87, 123, 193),
            appBar: const CustomAppBar(
              backgroundColor: Color.fromARGB(255, 87, 123, 193),
            ),
            body: CustomScrollView(key: const Key("quizKeyy"), slivers: [
              SliverToBoxAdapter(
                key: const Key("sliver1"),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Mark: 100 | Time: 5min",
                        style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final quiz = state.quiz[index];
                    return Column(
                      children: [
                        Text('total question:${quiz.question.length}',style: TextStyle(color: Colors.white),),
                        Text('${userResultCubit.selectedAnswers.length}')
                      ],
                    );
                  },
                  childCount: state.quiz.length,
                ),
              ),
            ]),
          );
        });
  }
}
