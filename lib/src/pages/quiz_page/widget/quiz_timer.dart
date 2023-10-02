import 'package:quizzy_app/quzzy_app_library.dart';

class QuizTimer extends StatelessWidget {
  const QuizTimer({
    required this.time,
    required this.seconds,
    super.key,
  });
  final int seconds;

  final double time;

  @override
  Widget build(BuildContext context) {
    final String text = seconds != 0 ? "$seconds" : "No \nSeconds";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: const Alignment(0, -0.775),
        child: Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: time,
                    strokeWidth: 6,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              Align(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
