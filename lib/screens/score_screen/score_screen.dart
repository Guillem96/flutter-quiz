import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  final int total;
  final int correct;

  const ScorePage({Key key, this.total, this.correct}) : super(key: key);

  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> with SingleTickerProviderStateMixin {
    
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;
  
  TextStyle tStyle;

  @override
  void initState() { 
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 1000), vsync: this);
    _fontSizeAnimation = CurvedAnimation(
      parent: _fontSizeAnimationController,
      curve: Curves.bounceOut
    );
    _fontSizeAnimation.addListener(() => this.setState((){}));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tStyle = new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60.0 * _fontSizeAnimation.value);
    return new Material(
       color: Colors.blueAccent,
       child: new InkWell(
         onTap: () => Navigator.of(context).popAndPushNamed("/home_page"),
         child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Your Score:", style: tStyle,),
              new Text("${widget.correct}/${widget.total}", style: tStyle),
              new Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
              new Icon(Icons.replay, size: 80.0, color: Colors.white)
            ],
          )
       )
    );
  }
}