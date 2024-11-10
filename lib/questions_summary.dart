import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];
            return Row(
              children: [
                Text(
                  (((data['question_index'] as int) + 1)).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String, textAlign: TextAlign.center,),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String,
                          style: TextStyle(
                            color: isCorrect ? Colors.green : Colors.red,
                          )),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 10,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
