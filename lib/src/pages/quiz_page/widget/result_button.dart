import 'package:quizzy_app/quzzy_app_library.dart';

class ResultButton extends StatelessWidget {
  const ResultButton({
    required this.answer,
    required this.onSelectAnswer,
    super.key,
  });

  final double answer;
  final Function(double answer) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            onSelectAnswer(double.parse(answer.toStringAsFixed(1)));
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: BorderSide(
              width: 3.0,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          child: Text(
            answer.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
