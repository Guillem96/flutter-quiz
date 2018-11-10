import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/question.dart';
import 'package:flutter_quiz/models/quiz.dart';
import 'package:flutter_quiz/screens/quiz_screen/widgets/question_text.dart';
import 'package:flutter_quiz/screens/quiz_screen/widgets/true_false_button.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz = new Quiz([new Question("Is Sugar Glider an Animal?", true)]);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      //> Like column, but stacks children on top of each other
      children: <Widget>[
        new Column(
          children: <Widget>[
            new TrueFalseButton(true, () => widget.quiz.answer(true)),
            new QuestionText(widget.quiz.current.question),
            new TrueFalseButton(false, () => widget.quiz.answer(false)),
          ],
        )
      ],
    );
  }

  void generateNextQuestion(bool answer) {
    widget.quiz.answer(true);
    setState(() {
      widget.quiz.next;
    });
  }
}
