import 'package:quizzy_app/quzzy_app_library.dart';


class ResultPage extends StatefulWidget {
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
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    if (widget.correctAnswer >= 8) {
      _confettiController = ConfettiController(
        duration: const Duration(seconds: 10),
      );
      _confettiController.play();
    }

    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Header(),
          Congratulation(controller: _confettiController),
          TotalScoreContainer(totalScore: widget.correctAnswer * 10),
          QuizResultContainer(
            correctAnswerCount: widget.correctAnswer,
            wrongAnswerCount: widget.wrongAnswer,
          ),
          ButtonContainer(level: widget.level),
          const BottomContainer(),
        ],
      ),
    );
  }
}
