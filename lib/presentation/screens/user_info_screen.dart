import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/component/app_bar.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import '../controller/user_data_bloc.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final userName = _nameController.text;
      context.read<UserDataCubit>().setUserName(userName);
      _playLottieAnimation(context);
    }
  }

  void _playLottieAnimation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Lottie.asset('assets/rocket.json'),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
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
            child: QuizScreen(userDataCubit: context.read<UserDataCubit>()),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 123, 193),
      appBar: const CustomAppBar(
          backgroundColor: Color.fromARGB(255, 87, 123, 193)),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Create your profile to start",
                  style: GoogleFonts.abel(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 110),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFEDEDED),
                      filled: true,
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Color(0xFF7B7878)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 7),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _nameController,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFEDEDED),
                      filled: true,
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Color(0xFF7B7878)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _submitForm(context);
                    },
                    child: Text(
                      "Start",
                      style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: const Color.fromARGB(255, 87, 123, 193),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
