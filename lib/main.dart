import 'package:quizzy_app/quzzy_app_library.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig().themeData,
      home: const HomePage(),
    ),
  );
}
