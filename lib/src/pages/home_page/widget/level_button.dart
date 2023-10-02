import 'package:quizzy_app/quzzy_app_library.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    required this.level,
    required this.text,
    super.key,
  });

  final String text;
  final AppLevel level;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(
              level: level,
            ),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 10,
        ),
        side: const BorderSide(width: 3.0, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primaryContainer,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
