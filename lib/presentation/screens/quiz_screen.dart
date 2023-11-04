import 'package:flutter/cupertino.dart';

import '../controller/user_data_bloc.dart';

class QuizScreen extends StatelessWidget {
  final UserDataCubit userDataCubit;
  const QuizScreen({Key? key, required this.userDataCubit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userName = userDataCubit.state;
    return Container(
      child: Center(
        child: Text('Hello, $userName!'), // Display the user's name
      ),
    );
  }
}
