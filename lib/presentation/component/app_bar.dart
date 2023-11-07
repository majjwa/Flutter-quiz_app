import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;

  const CustomAppBar({Key? key, required this.backgroundColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'QUIZ',
            style: GoogleFonts.acme(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            'UP',
            style: GoogleFonts.aboreto(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
