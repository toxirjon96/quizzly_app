import 'package:quizzy_app/quzzy_app_library.dart';

enum Operation {
  add("+"),
  subtract("-"),
  multiply("*"),
  divide("/");

  final String operation;

  const Operation(this.operation);
}

class QuizController {
  final QuizService quizService;

  const QuizController(this.quizService);

  QuizModel get quiz => quizService.generateQuizModel;

  void addUserAnswer(double? answer) {
    quizService.addUserAnswer(answer);
  }

  bool get endQuiz => quizService.endQuiz;

  int get quizCount => quizService.quizCount;

  int get quizOrder => quizService.quizOrder;

  int get quizThinkingTime => quizService.quizTime;

  int get correctAnswerCount => quizService.correctAnswerCount;

  int get incorrectAnswerCount => quizService.incorrectAnswers;
}
