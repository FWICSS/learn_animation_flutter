import 'package:flutter/material.dart';

class AnimatedSquare extends AnimatedWidget {
  static final _tweenSize = Tween(
    begin: 0.0,
    end: 200.0,
  );

  static final _tweenColor = ColorTween(
    begin: Colors.blue,
    end: Colors.red,
  );

  AnimatedSquare({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      width: _tweenSize.evaluate(animation),
      height: _tweenSize.evaluate(animation),
      color: _tweenColor.evaluate(animation),
    );
  }
}
