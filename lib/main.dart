import 'package:flutter/material.dart';

import 'Question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  List<Icon> scores = [];
  List<Question> questions = [
    Question(
        question: "You can lead a cow down stairs but not up stairs.",
        answer: false),
    Question(
        question: "Approximately one quarter of human bones are in the feet.",
        answer: true),
    Question(question: "A slug\'s blood is green.", answer: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  if (questions[questionNumber].answer) {
                    scores.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scores.add(Icon(Icons.warning, color: Colors.red));
                  }

                  if (questionNumber < questions.length - 1)
                    questionNumber++;
                  // questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  if (questions[questionNumber++].answer == false) {
                    scores.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scores.add(
                        Icon(Icons.warning_amber_outlined, color: Colors.red));
                  }

                  if (questionNumber < questions.length - 1)
                    questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
