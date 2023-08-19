import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/lobito.jpg',
          width: 28,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text("Learn Flutter the fun way!",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 6, 163, 45),
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 6, 163, 45))),
            child: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ))
      ],
    ));
  }
}
