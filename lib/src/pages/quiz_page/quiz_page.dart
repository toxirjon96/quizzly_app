import 'package:quizzy_app/quzzy_app_library.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    required this.level,
    super.key,
  });

  final AppLevel level;

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizModel quiz;
  late final QuizController controller;
  late double time;
  Timer? _timer;
  late int matchSeconds;

  void start() {
    time = 1.0;
    matchSeconds = controller.quizThinkingTime;
    if (widget.level != AppLevel.easy) {
      final period = 1 / matchSeconds;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          matchSeconds -= 1;
          time -= period;
        });
        if (time < 0) {
          timer.cancel();
          userAnswer(null);
        }
      });
    }
  }

  void generateQuiz() {
    if (!controller.endQuiz) {
      setState(() {
        quiz = controller.quiz;
      });
      start();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ResultPage(
            level: widget.level,
            correctAnswer: controller.correctAnswerCount,
            wrongAnswer: controller.incorrectAnswerCount,
          ),
        ),
      );
    }
  }

  void userAnswer(double? answer) {
    controller.addUserAnswer(answer);
    if (_timer != null) _timer!.cancel();
    generateQuiz();
  }

  @override
  void initState() {
    controller = QuizController(
      QuizService(
        level: widget.level,
      ),
    );
    generateQuiz();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Stack(
            children: [
              const TopBar(),
              QuizContainer(
                quizCount: controller.quizCount,
                quizOrder: controller.quizOrder,
                quizText: quiz.quizText,
              ),
              QuizTimer(
                time: time,
                seconds: matchSeconds,
              ),
              ResultContainer(
                userAnswer: userAnswer,
                answers: quiz.variants,
              ),
              const BottomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
