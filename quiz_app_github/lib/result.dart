import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Center(
          child: Text('You did it! Your score is $totalScore'),
        ),
        FlatButton(onPressed: resetHandler, child: Text('Reset the quiz!'))
      ],
    ));
  }
}
