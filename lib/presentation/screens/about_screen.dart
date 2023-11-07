import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/component/app_bar.dart';
import 'package:quiz_app/presentation/screens/program_screen.dart';
import 'package:quiz_app/presentation/screens/user_info_screen.dart';
import '../component/bottom_sheet.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 123, 193),
      appBar:const CustomAppBar(backgroundColor: Color.fromARGB(255, 87, 123, 193)),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: Stack(
            children: [
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 35,
                    child: DefaultTextStyle(
                        style: GoogleFonts.actor(color: Colors.white, fontSize: 16),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                'Do you like quizzes? Using quizUp can help students practice repeatedly while they learn,They can also reveal cohort misunderstanding to us. '
                                ),
                          ],
                        )),
                  )),
              Positioned.fill(top: 200, child: Lottie.asset('assets/girl.json')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomSheet(
        onPressLeft: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const ProgramScreen()));
        },
        onPressRight: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserInfoScreen()));
        },
        currentIndex: 2,
      ),
    );
  }
}
