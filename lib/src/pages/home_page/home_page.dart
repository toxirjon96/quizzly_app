import 'package:quizzy_app/quzzy_app_library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

enum AppLevel { easy, normal, hard }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              "assets/images/math-5.png",
            ),
            fit: BoxFit.cover,
            opacity: 0.25,
          ),
          color:
              Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
        ),
        child: const ColumnContainer(),
      ),
    );
  }
}
