import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/screens/about_screen.dart';
import 'package:quiz_app/presentation/screens/user_info_screen.dart';
import '../component/bottom_sheet.dart';
import 'intro_screen.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 147, 34),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 238, 147, 34),
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
              "Program",
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
                          'You have to answer all the 10 Questions & submit\n   to get your score.'),
                    ],
                  ))),
          Positioned.fill(top: 230, child: Lottie.asset('assets/man.json')),
        ],
      ),
      bottomNavigationBar: CustomBottomSheet(
        onPressLeft: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const IntroScreen()));
        },
        onPressRight: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutScreen()));
        },
        currentIndex: 1,
      ),
    );
  }
}
