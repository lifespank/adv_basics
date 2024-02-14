import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          var isCorrect = data['user_answer'] == data['correct_answer'];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: isCorrect
                    ? const Color.fromARGB(255, 29, 229, 255)
                    : const Color.fromARGB(255, 228, 56, 199),
                child: Text(((data['question_index'] as int) + 1).toString()),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['user_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 160, 39, 230),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 82, 192, 255),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
