import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/screens/program_screen.dart';
import 'package:quiz_app/presentation/screens/user_info_screen.dart';
import '../component/bottom_sheet.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 123, 193),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 87, 123, 193),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'QUIZ',
              style:
                  GoogleFonts.acme(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              'UP',
              style: GoogleFonts.aboreto(fontSize: 30),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Positioned.fill(child: Lottie.asset('assets/lamp.json')),
          Positioned(
            top: 110,
            left: 16,
            child: Text(
              "About",
              style: GoogleFonts.acme(
                color: Colors.white,
                fontSize: 45,
              ),
            ),
          ),
          Positioned(
              top: 170,
              left: 18,
              child: DefaultTextStyle(
                  style: GoogleFonts.actor(color: Colors.white, fontSize: 15),
                  child: const Column(
                    children: [
                      Text(
                          'Do you like quizzes?\nUsing quizUp can help students practice repeatly\nwhile they learn,'
                          '\nThey can also reveal cohort misunderstanding to us. '
                          ),
                    ],
                  ))),
          Positioned.fill(top: 230, child: Lottie.asset('assets/girl.json')),
        ],
      ),
      bottomNavigationBar: CustomBottomSheet(
        onPressLeft: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const ProgramScreen()));
        },
        onPressRight: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserInfoScreen()));
        },
        currentIndex: 2,
      ),
    );
  }
}
