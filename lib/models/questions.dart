import 'package:flutter_quiz/models/question.dart';

class Questions {
  final List<Question> _questions;
  int _current;
  int _score;

  Questions(this._questions) {
    _questions.shuffle();
    _current = 0;
  }

  int             get score     => _score;
  Question        get current   => _questions[_current];
  List<Question>  get questions => _questions;
  int             get length    => _questions.length;

  Question get next {
    _current++;
    return _current == _questions.length ? null : _questions[_current];
  }

  void answer(bool isCoorect) {
    if (isCoorect) _score++;
  }
}