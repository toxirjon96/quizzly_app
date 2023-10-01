import 'package:quizzy_app/quzzy_app_library.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    required this.userAnswer,
    required this.answers,
    super.key,
  });

  final Function(double? answer) userAnswer;
  final List<double> answers;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 100,
          ),
          ...answers.map<Widget>((e) {
            return ResultButton(
              answer: e,
              onSelectAnswer: userAnswer,
            );
          }).toList(),
        ],
      ),
    );
  }
}
