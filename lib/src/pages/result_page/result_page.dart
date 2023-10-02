import 'package:quizzy_app/quzzy_app_library.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.level,
    super.key,
  });
  final int correctAnswer;
  final int wrongAnswer;

  final AppLevel level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Header(),
          TotalScoreContainer(totalScore: correctAnswer * 10),
          QuizResultContainer(
            correctAnswerCount: correctAnswer,
            wrongAnswerCount: wrongAnswer,
          ),
          ButtonContainer(level: level),
          const BottomContainer(),
        ],
      ),
    );
  }
}
