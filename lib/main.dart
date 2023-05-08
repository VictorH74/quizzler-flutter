import 'package:flutter/material.dart';

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
  final List<QuestionData> _questions = [
    QuestionData(question: "A Terra é redonda.", isRight: true),
    QuestionData(question: "O Sol é uma estrela.", isRight: true),
    QuestionData(question: "A capital do Brasil é Brasília.", isRight: true),
    QuestionData(question: "A água ferve a 100 graus Celsius.", isRight: true),
    QuestionData(
        question: "O tigre é o maior felino do mundo.", isRight: false),
    QuestionData(question: "O Japão é um país insular.", isRight: true),
    QuestionData(question: "O chocolate vem do cacau.", isRight: true),
    QuestionData(
        question: "O Skype é um aplicativo de videoconferência.",
        isRight: true),
    QuestionData(
        question: "A Mona Lisa é uma pintura famosa de Leonardo da Vinci.",
        isRight: true),
    QuestionData(
        question: "A clorofila é responsável pela cor verde das plantas.",
        isRight: true),
  ];

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

    if (questionNumber > _questions.length - 1) {
      int wrongs = 0;
      int corrects = 0;

      for (var i = 0; i < _questions.length; i++) {
        if (_scoreList[i] == _questions[i].isRight) {
          corrects++;
        } else {
          wrongs++;
        }
      }

      TextStyle style = theme.textTheme.displaySmall!
          .copyWith(color: theme.colorScheme.onPrimary);

      display = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (wrongs > corrects)
            Text(
              "Não foi dessa vez...",
              style: style,
            ),
          if (wrongs < corrects && wrongs > 0)
            Text(
              "Nada mal :)",
              style: style,
            ),
          if (wrongs < corrects && wrongs == 0)
            Text(
              "Meus parabêns!!",
              style: style,
            ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Seu resultado:",
            style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 35,
              ),
              Text(
                corrects.toString(),
                style:
                    TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.close,
                color: Colors.red,
                size: 35,
              ),
              Text(
                wrongs.toString(),
                style:
                    TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: _resetScoreList,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    theme.colorScheme.onPrimary)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Reiniciar", style: TextStyle(fontSize: 20)),
            ),
          )
        ],
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
                  _questions[questionNumber].question,
                  style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
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
                  style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
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
                    style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
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

class QuestionData {
  final String question;
  final bool isRight;

  QuestionData({
    required this.question,
    required this.isRight,
  });
}
