import 'package:flutter/material.dart';

class TrueFalseButton extends StatelessWidget {
  final bool _trueOrFalse;
  final VoidCallback _onTap;
  
  TrueFalseButton(this._trueOrFalse, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      //> In Columns widgets tries to fit as less as possible,
      // with expanded we force that a widget is expanded as much as possible
      child: new Material(
        color: _trueOrFalse ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: _onTap,
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5.0)
              ),
              padding: new EdgeInsets.all(20.0),
              child: new Text(
                _trueOrFalse ? "True" : "False", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 40.0, 
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}
