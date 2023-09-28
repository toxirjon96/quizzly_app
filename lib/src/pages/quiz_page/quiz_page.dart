import 'package:quizzy_app/quzzy_app_library.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    required this.level,
    super.key,
  });

  final AppLevel level;

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

enum Operation {
  add("+"),
  subtract("-"),
  multiply("*"),
  divide("/");

  final String operation;

  const Operation(this.operation);
}

class _QuizPageState extends State<QuizPage> {
  late int a;
  late int b;
  late Operation operation;
  List<double> results = [];
  List<double?> userSelect = [];
  List<double> trueResult = [];
  int questionIndex = 0;
  int questionCount = 10;
  double time = 1.0;
  Timer? _timer;
  int matchSeconds = 0;

  void start() {
    time = 1;
    if (widget.level == AppLevel.hard) {
      matchSeconds = 15;
    } else if (widget.level == AppLevel.normal) {
      matchSeconds = 20;
    }
    if (widget.level != AppLevel.easy) {
      final period = 1 / matchSeconds;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          matchSeconds -= 1;
          time -= period;
        });
        if (time < 0) {
          timer.cancel();
          if (questionIndex != questionCount) {
            userAnswer(null);
          }
        }
      });
    }
  }

  void makeQuestion() {
    questionIndex += 1;
    a = Random().nextInt(10) + 1;
    b = Random().nextInt(10) + 1;
    operation = Operation.values[Random().nextInt(Operation.values.length)];
    double answer = switch (operation) {
      Operation.add => (a + b).toDouble(),
      Operation.subtract => (a - b).toDouble(),
      Operation.multiply => (a * b).toDouble(),
      Operation.divide => (a / b).toDouble(),
    };
    trueResult.add(answer);
    results = [];
    results.add(answer);
    for (int i = 0; i < 3; i++) {
      double seed = Random().nextDouble() + answer;
      if (results.contains(seed)) {
        results.add(seed + 1);
      } else {
        results.add(seed);
      }
    }
    results.shuffle();
    start();
    setState(() {});
  }

  void userAnswer(double? answer) {
    userSelect.add(answer);
    if (questionIndex < questionCount) {
      makeQuestion();
    }
    print(questionCount);
    print(questionIndex);
    print(userSelect);
    print(trueResult);
  }

  @override
  void initState() {
    makeQuestion();
    start();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20),
              height: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                alignment: const Alignment(-0.5, -0.6),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Question $questionIndex/$questionCount",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$a ${operation.operation} $b = ?",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: const Alignment(0, -0.775),
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: CircularProgressIndicator(
                    value: time,
                    strokeWidth: 6,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  ...results.map<Widget>((e) {
                    return ResultButton(
                      answer: e,
                      onSelectAnswer: userAnswer,
                    );
                  }).toList(),
                ],
              ),
            ),
            Align(
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
            ),
          ],
        ),
      ),
    );
  }
}
