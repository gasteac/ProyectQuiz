import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 168, 77, 184)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: const StartScreen());
  }
}
