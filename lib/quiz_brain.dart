import 'package:quizzler_app/question.dart';

class QuizBrain {
  final List<Question> _questions = [
    Question(question: "A Terra é redonda.", isRight: true),
    Question(question: "O Sol é uma estrela.", isRight: true),
    Question(question: "A capital do Brasil é Brasília.", isRight: true),
    Question(question: "A água ferve a 100 graus Celsius.", isRight: true),
    Question(question: "O tigre é o maior felino do mundo.", isRight: false),
    Question(question: "O Japão é um país insular.", isRight: true),
    Question(question: "O chocolate vem do cacau.", isRight: true),
    Question(
        question: "O Skype é um aplicativo de videoconferência.",
        isRight: true),
    Question(
        question: "A Mona Lisa é uma pintura famosa de Leonardo da Vinci.",
        isRight: true),
    Question(
        question: "A clorofila é responsável pela cor verde das plantas.",
        isRight: true),
  ];

  String getQuestionText(int questionNumber) {
    return _questions[questionNumber].question;
  }

  int getQuestionsLength() {
    return _questions.length;
  }

  bool compare(bool toCompare, int questionNumber){
    return toCompare == _questions[questionNumber].isRight;
  }
}
