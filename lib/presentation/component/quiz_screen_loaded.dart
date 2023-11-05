import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/screens/result_screen.dart';
import '../../domain/entities/quiz.dart';
import '../controller/question_bloc.dart';
import 'app_bar.dart';

class QuizScreenLoaded extends StatelessWidget {
  const QuizScreenLoaded({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      buildWhen: (previous, current) => previous.state != current.state,
      builder: (BuildContext context, state) {
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
                    final quiz = state.quiz[index];
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
                                    padding:
                                        EdgeInsets.only(left: 10, right: 3)),
                                Expanded(
                                  child: Text(
                                    'Q. ${quiz.question}',
                                    style: GoogleFonts.abel(
                                        color: const Color.fromARGB(
                                            255, 97, 103, 122),
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
                  childCount: state.quiz.length,
                ),
              ),
              SliverList(delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 10,left: 80,right: 80),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WillPopScope(
                              onWillPop: () async {
                                // close the app
                                SystemNavigator.pop();
                                return false; // Prevent default back behavior
                              },
                              child: ResultScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.actor(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 87, 123, 193),
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ],
          ),
        );
      },
    );
  }
}

class RadioGroup extends StatefulWidget {
  final Quiz quiz;

  const RadioGroup({super.key, required this.quiz});

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
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
    return RadioListTile<int>(
      value: option,
      activeColor: const Color.fromARGB(255, 97, 103, 122),
      groupValue: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
        });
        context.read<QuestionBloc>().updateSelectedAnswer(
          widget.quiz.id,
          value!,
        );

      },
      title: Text(
        answer,
        style: GoogleFonts.abel(
            color: const Color.fromARGB(255, 97, 103, 122), fontSize: 18),
      ),
    );
  }
}
