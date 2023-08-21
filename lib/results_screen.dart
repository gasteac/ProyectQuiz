import 'package:flutter/material.dart';
import "package:adv_basics/data/questions.dart";
import "package:adv_basics/questions_summary.dart";
import "package:google_fonts/google_fonts.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.switchScreen,
      {super.key, required this.chosenAnswers});
  final Function() switchScreen;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Here are your results!",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text(
                "You answered $numCorrectQuestions of $numTotalQuestions questions correctly",
                style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            QuestionSummary(summaryData),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text("Try Again ;)"),
                onPressed: switchScreen)
          ],
        ),
      ),
    );
  }
}
