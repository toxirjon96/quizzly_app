import 'package:quizzy_app/quzzy_app_library.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
          ),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Center(
          child: Text(
            "QUIZZLY",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
