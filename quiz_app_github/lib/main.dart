import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Purple', 'score': 6},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 2}
      ]
    },
    {
      'questionText': 'What is your favorite team?',
      'answers': [
        {'text': 'Fenerbahçe', 'score': 10},
        {'text': 'Beşiktaş', 'score': 5},
        {'text': 'Galatasaray', 'score': 3},
        {'text': 'Trabzonspor', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 7},
        {'text': 'Cat', 'score': 4},
        {'text': 'Whale', 'score': 1},
        {'text': 'Rabbit', 'score': 10}
      ]
    },
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
