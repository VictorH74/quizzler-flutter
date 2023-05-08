import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:quizzler_app/views/views.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xff1E1E1E))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _scoreList = [];

  void _addTrueValue() {
    setState(() {
      _scoreList.add(true);
    });
  }

  void _addFalseValue() {
    setState(() {
      _scoreList.add(false);
    });
  }

  void _resetScoreList() {
    setState(() {
      _scoreList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    const double spacing = 20;
    final ThemeData theme = Theme.of(context);

    Widget display;
    int questionNumber = _scoreList.isNotEmpty ? _scoreList.length : 0;

    if (questionNumber > quizBrain.getQuestionsLength() - 1) {
      int wrongAnswers = 0;
      int correctAnswers = 0;

      for (var i = 0; i < quizBrain.getQuestionsLength(); i++) {
        if (quizBrain.compare(_scoreList[i], i)) {
          correctAnswers++;
        } else {
          wrongAnswers++;
        }
      }

      display = ResultPage(
        wrongAnswers: wrongAnswers,
        correctAnswers: correctAnswers,
        resetScoreList: _resetScoreList,
      );
    } else {
      display = Padding(
        padding: const EdgeInsets.all(spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(questionNumber),
                  style: TextStyle(
                      color: theme.colorScheme.onPrimary, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: _addTrueValue,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                child: Text(
                  "Verdadeiro",
                  style: TextStyle(
                      color: theme.colorScheme.onPrimary, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: spacing,
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: _addFalseValue,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text(
                    "Falso",
                    style: TextStyle(
                        color: theme.colorScheme.onPrimary, fontSize: 20),
                  )),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: (Scaffold(
        backgroundColor: theme.colorScheme.onBackground,
        body: display,
      )),
    );
  }
}
