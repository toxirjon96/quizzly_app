import 'package:quizzy_app/quzzy_app_library.dart';

class ThemeConfig {
  final kColorSchema = ColorScheme.fromSeed(
    seedColor: const Color(0xFFD014FF),
  );

  ThemeData get themeData => ThemeData(fontFamily: "DMSans").copyWith(
        useMaterial3: true,
        colorScheme: kColorSchema,
      );
}
