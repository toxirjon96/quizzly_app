import 'package:quizzy_app/quzzy_app_library.dart';

class ColumnContainer extends StatelessWidget {
  const ColumnContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Info(),
        Column(
          children: [
            LevelButton(level: AppLevel.easy, text: "Level 1"),
            SizedBox(
              height: 15,
            ),
            LevelButton(level: AppLevel.normal, text: "Level 2"),
            SizedBox(
              height: 15,
            ),
            LevelButton(level: AppLevel.hard, text: "Level 3"),
          ],
        )
      ],
    );
  }
}
