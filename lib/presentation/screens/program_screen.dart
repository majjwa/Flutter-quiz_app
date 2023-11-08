import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/component/app_bar.dart';
import 'package:quiz_app/presentation/screens/about_screen.dart';
import 'package:quiz_app/presentation/screens/user_info_screen.dart';
import '../component/bottom_sheet.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 147, 34),
      appBar: const CustomAppBar(
          backgroundColor: Color.fromARGB(255, 238, 147, 34)),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: Stack(
            children: [
              Positioned.fill(top: 230, child: Lottie.asset('assets/man.json')),
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  child: DefaultTextStyle(
                    style: GoogleFonts.actor(
                        color: Colors.white, fontSize: 16),
                    child: const Text(
                        'You have to answer all the 10 Questions & submit to get your score.'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomSheet(
        onPressLeft: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const AboutScreen()));
        },
        onPressRight: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  UserInfoScreen()));
        },
        currentIndex: 2,
      ),
    );
  }
}
