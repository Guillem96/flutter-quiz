import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/quiz_screen/quiz_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: new InkWell( //> Invisible button, with wave animation
        onTap: () => Navigator.of(context).pushNamed('/quiz_page'),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Quizzz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text("Tap tp start", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        )
      )
    );
  }
}