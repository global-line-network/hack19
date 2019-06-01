import 'package:flutter/material.dart';

class AnimatedStatusIcon extends AnimatedWidget {
  AnimatedStatusIcon({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Icon(
      Icons.check_circle_outline,
      color: Colors.red,
      size: animation.value,
    );
  }
}
