import 'package:quizzy_app/quzzy_app_library.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({
    required this.controller,
    super.key,
  });

  final ConfettiController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.8),
      child: ConfettiWidget(
        confettiController: controller,
        blastDirection: 0,
        // radial value - RIGHT
        emissionFrequency: 0.6,
        minimumSize: const Size(10, 10),
        // set the minimum potential size for the confetti (width, height)
        maximumSize: const Size(50, 50),
        // set the maximum potential size for the confetti (width, height)
        numberOfParticles: 1,
        gravity: 0.1,
      ),
    );
  }
}
