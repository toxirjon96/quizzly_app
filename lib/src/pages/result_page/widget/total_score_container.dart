import 'package:quizzy_app/quzzy_app_library.dart';

class TotalScoreContainer extends StatelessWidget {
  const TotalScoreContainer({
    required this.totalScore,
    super.key,
  });

  final int totalScore;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.8),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your score",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            Text(
              "$totalScore",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
