import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final Function() switchScreen;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quizlogo.png', width: 200),
        const SizedBox(
          height: 40,
        ),
        Text("Flutter Quiz ✨🐺",
            style: GoogleFonts.lato(
                fontSize: 25,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 39, 165, 123))),
          label: Text(
            "Start Quiz",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          icon: const Icon(Icons.arrow_circle_right_outlined,
              color: Colors.white),
        )
      ],
    ));
  }
}
