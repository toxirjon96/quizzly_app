import 'package:quizzy_app/quzzy_app_library.dart';

class QuizContainer extends StatelessWidget {
  const QuizContainer({
    required this.quizCount,
    required this.quizOrder,
    required this.quizText,
    super.key,
  });

  final int quizCount;
  final int quizOrder;
  final String quizText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Align(
        alignment: const Alignment(-0.5, -0.6),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Question $quizOrder/$quizCount",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                quizText,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
