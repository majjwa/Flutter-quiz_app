import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/screens/result_screen.dart';
import '../../domain/entities/quiz.dart';
import '../controller/question_bloc.dart';
import '../controller/user_result_cubit.dart';
import 'app_bar.dart';

class QuizScreenLoaded extends StatelessWidget {
  const QuizScreenLoaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<QuestionBloc>(context);
    final userResultCubit = BlocProvider.of<UserResultCubit>(context);
    bool isQuizCompleted() {
      final userResultState = userResultCubit.state;
      final totalQuestions = questionBloc.state.quiz.length;
      final selectedAnswersCount = userResultState.selectedanswers.length;
      return selectedAnswersCount == totalQuestions;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 123, 193),
      appBar: const CustomAppBar(
        backgroundColor: Color.fromARGB(255, 87, 123, 193),
      ),
      body: CustomScrollView(
        key: const Key("quizKey"),
        slivers: [
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
                final quiz = questionBloc.state.quiz[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 18)),
                        Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(left: 10, right: 3)),
                            Expanded(
                              child: Text(
                                'Q. ${quiz.question}',
                                style: GoogleFonts.abel(
                                    color:
                                        const Color.fromARGB(255, 97, 103, 122),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        RadioGroup(quiz: quiz),
                      ],
                    ),
                  ),
                );
              },
              childCount: questionBloc.state.quiz.length,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 10, left: 80, right: 80),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (isQuizCompleted()) {
                          final correctAnswer =
                              questionBloc.state.correctAnswers;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResultScreen(correctAnswers: correctAnswer),
                            ),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: ShapeBorder.lerp(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    const CircleBorder(),
                                    0.1,
                                  ),
                                  content: Text(
                                    'Please answer all questions before submitting.',
                                    style: GoogleFonts.acme(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 97, 103, 122),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'OK',
                                          style: GoogleFonts.acme(
                                            fontSize: 24,
                                            color: const Color.fromARGB(
                                                255, 97, 103, 122),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.acme(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: const Color.fromARGB(255, 87, 123, 193),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class RadioGroup extends StatefulWidget {
  final Quiz quiz;

  const RadioGroup({super.key, required this.quiz});

  @override
  RadioGroupState createState() => RadioGroupState();
}

class RadioGroupState extends State<RadioGroup> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.quiz.answers.answerA != null)
          buildRadioTile(1, widget.quiz.answers.answerA!),
        if (widget.quiz.answers.answerB != null)
          buildRadioTile(2, widget.quiz.answers.answerB!),
        if (widget.quiz.answers.answerC != null)
          buildRadioTile(3, widget.quiz.answers.answerC!),
        if (widget.quiz.answers.answerD != null)
          buildRadioTile(4, widget.quiz.answers.answerD!),
      ],
    );
  }

  Widget buildRadioTile(int option, String answer) {
    final userResultCubit = context.read<UserResultCubit>();
    return RadioListTile<int>(
      value: option,
      activeColor: const Color.fromARGB(255, 97, 103, 122),
      groupValue: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
        });
        userResultCubit.updateSelectedAnswer(widget.quiz.id, selectedOption);
      },
      title: Text(
        answer,
        style: GoogleFonts.abel(
          color: const Color.fromARGB(255, 97, 103, 122),
          fontSize: 18,
        ),
      ),
    );
  }
}
