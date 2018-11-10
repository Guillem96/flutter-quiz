import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;

  const CorrectWrongOverlay(this._isCorrect);

  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  
  Animation<double> _iconAnimation;   //> This will increment from 0 to 1 progressively
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      duration: new Duration(seconds: 2),
      vsync: this
    );

    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.elasticOut // Animation increments type
    );
    _iconAnimation.addListener(() => this.setState((){}));

    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print("Overlay tapped"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(10.0),
              margin: new EdgeInsets.only(bottom: 10.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: new Icon(
                  widget._isCorrect ? Icons.done: Icons.clear,
                  size: 80.0 * _iconAnimation.value,
                ),
              ),
            ),
            new Text(
              widget._isCorrect ? "Correct!" : "Wrong...",
              style: new TextStyle(
                color:Colors.white,
                fontSize: 30.0
              ),
            )
          ],
        )
      ),
      
    );
  }
}