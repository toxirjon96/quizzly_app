import 'package:quizzy_app/quzzy_app_library.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    required this.level,
    super.key,
  });

  final AppLevel level;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.5),
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TaskButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(level: level),
                  ),
                );
              },
              text: "Play Again",
            ),
            TaskButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              text: "Home",
            ),
          ],
        ),
      ),
    );
  }
}
