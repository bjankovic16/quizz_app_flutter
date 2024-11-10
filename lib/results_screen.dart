import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.choosenAnswers, this.restartQuiz, {super.key});

  final List<String> choosenAnswers;
  void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotal = questions.length;
    final correct = summaryData.where((item) {
      return item['user_answer'] == item['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correct out of $numTotal questions',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: restartQuiz,
              child: Text('Restart quiz'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
