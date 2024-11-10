import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Opacity(
            opacity: 0.7,
            child: Image(
              image: AssetImage('assets/quiz-logo.png'),
              width: 300,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn flutter fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start quiz'),
          ),
        ],
      ),
    );
  }
}
