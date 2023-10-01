import 'package:quizzy_app/quzzy_app_library.dart';

final Random randomGenerator = Random();

class QuizModel {
  final double firstNumber;
  final double secondNumber;
  final Operation operation;
  late final List<double> variants;

  QuizModel({
    required this.firstNumber,
    required this.secondNumber,
    required this.operation,
  }) {
    variants = _variantList;
  }

  List<double> get _variantList {
    List<double> variantList = [];
    double answer = trueResult;
    variantList.add(answer);

    int seedRandom = (answer + 1).ceil();

    while (true) {
      if (variantList.length == 4) break;
      int temp = randomGenerator.nextInt(10 + seedRandom);
      double rNumber = temp.toDouble();
      if (variantList.contains(rNumber)) {
        variantList.add(rNumber + 1);
      } else {
        variantList.add(rNumber);
      }
      seedRandom++;
    }
    variantList.shuffle();

    return variantList;
  }

  String get quizText =>
      "$firstNumber ${operation.operation} $secondNumber = ?";

  double get trueResult => switch (operation) {
        Operation.add => firstNumber + secondNumber,
        Operation.subtract => firstNumber - secondNumber,
        Operation.multiply => firstNumber * secondNumber,
        Operation.divide => firstNumber / secondNumber,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizModel &&
          runtimeType == other.runtimeType &&
          firstNumber == other.firstNumber &&
          secondNumber == other.secondNumber &&
          operation == other.operation;

  @override
  int get hashCode =>
      firstNumber.hashCode ^ secondNumber.hashCode ^ operation.hashCode;

  @override
  String toString() {
    return 'QuizModel(firstNumber: $firstNumber, secondNumber: $secondNumber, operation: $operation)';
  }
}
