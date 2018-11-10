class Question {
  final String question;
  final bool solution;

  Question(this.question, this.solution);

  bool answer(bool userAnswer) {
    return solution == userAnswer;
  }
}