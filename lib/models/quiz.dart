import 'package:flutter_quiz/models/question.dart';

class Quiz {
  final List<Question> _questions;
  int _current;
  int _score;

  Quiz(this._questions) {
    _questions.shuffle();
    _current = 0;
    _score = 0;
  }

  int             get score     => _score;
  Question        get current   => _questions[_current];
  List<Question>  get questions => _questions;
  int             get length    => _questions.length;
  bool            get hasNext   => _current < _questions.length;

  Question get next {
    if (_current == _questions.length)
      return null;

    Question following =  _questions[_current];
    _current++;
    
    return following;
  }

  void updateScore(bool isCorrect) {
    if (isCorrect) 
      _score++;
  }
}