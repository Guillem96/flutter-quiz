import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String _questionText;


  const QuestionText(this._questionText);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Center(
        child: new Container(
          padding: new EdgeInsets.symmetric(vertical: 30.0),
          child: new Text(
            _questionText,
            style: new TextStyle(fontSize: 30.0, color: Colors.grey),
          ),
        )
      )
    );
  }
}
