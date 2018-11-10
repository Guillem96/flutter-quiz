import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
 
  final String _questionText;

  const QuestionText(this._questionText);

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin { //> With single ticker we van only have one animation controller

  Animation<double> _fontSizeAnimation;   //> This will increment from 0 to 1 progressively
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this
    );

    _fontSizeAnimation = new CurvedAnimation(
      parent: _fontSizeAnimationController,
      curve: Curves.bounceOut // Animation increments type
    );
    _fontSizeAnimation.addListener(() => this.setState((){}));

    _fontSizeAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Center(
        child: new Container(
          padding: new EdgeInsets.symmetric(vertical: 30.0),
          child: new Text(
            widget._questionText,
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 20.0, color: Colors.grey),
          ),
        )
      )
    );
  }
}
