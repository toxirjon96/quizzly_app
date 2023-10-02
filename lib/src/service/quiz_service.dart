import 'package:quizzy_app/quzzy_app_library.dart';

class QuizService {
  final List<double?> userAnswers = [];
  final List<double> trueAnswers = [];
  final List<QuizModel> quizList = [];
  final int quizCount;
  final AppLevel level;

  QuizService({
    this.quizCount = 10,
    this.level = AppLevel.easy,
  });

  QuizModel get generateQuizModel {
    Operation operation =
        Operation.values[randomGenerator.nextInt(Operation.values.length)];
    int a = randomGenerator.nextInt(10);
    int b = randomGenerator.nextInt(10);

    if (operation == Operation.divide && b == 0) b++;

    QuizModel quizModel = QuizModel(
      firstNumber: a.toDouble(),
      secondNumber: b.toDouble(),
      operation: operation,
    );
    if (!endQuiz) {
      quizList.add(quizModel);
      trueAnswers.add(quizModel.trueResult);
    }

    return quizModel;
  }

  bool get endQuiz => quizList.length == quizCount;

  void addUserAnswer(double? answer) => userAnswers.add(answer);

  int get correctAnswerCount {
    int count = 0;
    for (int i = 0; i < trueAnswers.length; i++) {
      if (userAnswers[i] != null && userAnswers[i] == trueAnswers[i]) {
        count++;
      }
    }
    return count;
  }

  int get quizOrder => quizList.length;

  int get incorrectAnswers => trueAnswers.length - correctAnswerCount;

  int get quizTime => switch (level) {
        AppLevel.easy => 0,
        AppLevel.normal => 20,
        AppLevel.hard => 15,
      };
}
