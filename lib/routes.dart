import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/quiz_screen/quiz_screen.dart';

class Router {
  static var routes = <String, WidgetBuilder> {
    '/quiz_page': (BuildContext ctxt) => new QuizPage()
  };
}