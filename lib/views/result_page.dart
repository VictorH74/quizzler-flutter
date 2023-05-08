import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
        required this.wrongAnswers,
        required this.correctAnswers,
        required this.resetScoreList});

  final int wrongAnswers;
  final int correctAnswers;
  final void Function() resetScoreList;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    TextStyle style = theme.textTheme.displaySmall!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (wrongAnswers > correctAnswers)
          Text(
            "Não foi dessa vez...",
            style: style,
          ),
        if (wrongAnswers < correctAnswers && wrongAnswers > 0)
          Text(
            "Nada mal :)",
            style: style,
          ),
        if (wrongAnswers < correctAnswers && wrongAnswers == 0)
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
              correctAnswers.toString(),
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
              wrongAnswers.toString(),
              style:
              TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        TextButton(
          onPressed: resetScoreList,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  theme.colorScheme.onPrimary)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Text("Reiniciar", style: TextStyle(fontSize: 20)),
          ),
        )
      ],
    );
  }
}