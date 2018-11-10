import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/question.dart';
import 'package:flutter_quiz/models/quiz.dart';
import 'package:flutter_quiz/routes.dart';
import 'package:flutter_quiz/screens/quiz_screen/widgets/correct_wrong_overlay.dart';
import 'package:flutter_quiz/screens/quiz_screen/widgets/question_text.dart';
import 'package:flutter_quiz/screens/quiz_screen/widgets/true_false_button.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = new Quiz([
    new Question("Is Sugar Glider an Animal?", true),
    new Question("Is Elon Musk a human?", false),
    new Question("Is pizza healty?", false),
    new Question("Is Flutter awesome?", true)
  ]);

  Question current;
  bool isCorrect;
  bool showOverlay = false;

  @override
  void initState() {
    current = quiz.next;
    isCorrect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Expand childrens to full screen
      //> Like column, but stacks children on top of each other
      children: <Widget>[
        new Column(
          children: <Widget>[
            new TrueFalseButton(true, () => generateNextQuestion(true)),
            new QuestionText(current.question),
            new TrueFalseButton(false, () => generateNextQuestion(false)),
          ],
        ),
        showOverlay
            ? new CorrectWrongOverlay(
                isCorrect,
                this.onOverlayClosed
              )
            : new Container() //> Empty container to hide
      ],
    );
  }

  void onOverlayClosed() {
    setState(() {
      showOverlay = false;
      if (quiz.hasNext) 
        current = quiz.next;
      else {
        Router.params['total'] = quiz.length.toString();
        Router.params['correct'] = quiz.score.toString();
        Navigator.of(context).popAndPushNamed('/score_page');
      }
    });
  }

  void generateNextQuestion(bool answer) {
    isCorrect = current.answer(answer);
    quiz.updateScore(isCorrect);

    this.setState(() => showOverlay = true);
  }
}
