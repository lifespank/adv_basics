import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    // final List<Map<String, Object>> summary = [];
    // for (var i = 0; i < chosenAnswers.length; i++) {
    //   summary.add({
    //     'question_index': i,
    //     'question': questions[i].text,
    //     'correct_answer': questions[i].answers[0],
    //     'user_answer': chosenAnswers[i],
    //   });
    // }
    // return summary;
    final List<Map<String, Object>> summary = chosenAnswers
        .mapIndexed((index, userAnswer) => {
              'question_index': index,
              'question': questions[index].text,
              'correct_answer': questions[index].answers[0],
              'user_answer': userAnswer,
            })
        .toList();
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.fold(
        0,
        (correctCount, element) =>
            element['correct_answer'] == element['user_answer']
                ? correctCount + 1
                : correctCount);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Color.fromARGB(186, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: restartQuiz,
              label: const Text('Restart Quiz'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
