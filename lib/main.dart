import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/controller/question_bloc.dart';
import 'package:quiz_app/presentation/controller/user_data_cubit.dart';
import 'package:quiz_app/presentation/controller/user_result_cubit.dart';
import 'package:quiz_app/presentation/screens/intro_screen.dart';

import 'core/service_locator.dart';

// void main() {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   ServiceLocator().init();
//   runApp(const MyApp());
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<QuestionBloc>(
          create: (context) => QuestionBloc(sl()),
        ),
        BlocProvider<UserResultCubit>(
          create: (context) => UserResultCubit(),
        ),
        BlocProvider<UserDataCubit>(create: (context) => UserDataCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
