import 'package:flutter/material.dart';
import 'package:flutter_quiz/routes.dart';
import 'package:flutter_quiz/screens/home_screen/home_screen.dart';
import 'package:flutter_quiz/screens/score_screen/score_screen.dart';

main() => runApp(new MaterialApp(
  home: new ScorePage(total: 4, correct: 3,),
  routes: Router.routes,
));