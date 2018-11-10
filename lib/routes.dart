import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/home_screen/home_screen.dart';
import 'package:flutter_quiz/screens/quiz_screen/quiz_screen.dart';
import 'package:flutter_quiz/screens/score_screen/score_screen.dart';

class Router {
  static Map<String, String> params;
  
  static var routes = <String, WidgetBuilder> {
    '/quiz_page': (_) => new QuizPage(),
    '/home_page': (_) => new HomePage(),
    '/score_page': (_) => new ScorePage(total: int.parse(params['total']), correct: int.parse(params['correct']))
  };
}