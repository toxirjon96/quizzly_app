import 'package:quizzy_app/quzzy_app_library.dart';

class QuizTimer extends StatelessWidget {
  const QuizTimer({
    required this.time,
    super.key,
  });

  final double time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: const Alignment(0, -0.775),
        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            shape: BoxShape.circle,
          ),
          child: CircularProgressIndicator(
            value: time,
            strokeWidth: 6,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
