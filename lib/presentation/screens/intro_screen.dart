import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/component/app_bar.dart';
import 'package:quiz_app/presentation/component/bottom_sheet.dart';
import 'package:quiz_app/presentation/screens/program_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 123, 123),
      appBar: const CustomAppBar(
          backgroundColor: Color.fromARGB(255, 237, 123, 123)),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 500,
            ),
            Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.1,
                child: Lottie.asset('assets/study.json')),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Text(
                  "Show real",
                  style: GoogleFonts.abel(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.14,
                left: MediaQuery.of(context).size.width * 0.1,
                child: DefaultTextStyle(
                  style: GoogleFonts.acme(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                  child: const Column(
                    children: [
                      Text("Power"),
                      Text("of your"),
                      Text("mind"),
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomSheet(
        onPressLeft: () {},
        onPressRight: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProgramScreen()));
        },
        currentIndex: 0,
      ),
    );
  }
}
