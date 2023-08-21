import 'package:adv_basics/question_screen.dart';
import "package:flutter/material.dart";
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

  // comenzar y retsar el quiz estan los 2 en esta funcion, deberia separarlo.
  switchScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswer, switchScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 4, 104, 87),
            Color.fromARGB(255, 18, 136, 58)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: screenWidget,
        ),
      ),
    );
  }
}
