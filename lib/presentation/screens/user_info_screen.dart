import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
