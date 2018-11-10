import 'package:flutter/material.dart';
import 'package:flutter_quiz/routes.dart';
import 'package:flutter_quiz/screens/home_screen/home_screen.dart';

main() => runApp(new MaterialApp(
  home: new HomePage(),
  routes: Router.routes,
));