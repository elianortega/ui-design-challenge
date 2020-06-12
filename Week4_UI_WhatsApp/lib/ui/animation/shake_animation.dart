import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

class ShakeAnimation extends StatelessWidget {
  final int delay;
  final Widget child;
  final Curve curve;

  const ShakeAnimation({Key key, this.delay = 1000, this.curve, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: delay),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, _) {
        return ShakeAnimatedWidget(
          duration: Duration(milliseconds: 700),
          curve: Curves.linear,
          enabled: value == 1 ? false : true,
          shakeAngle: Rotation.deg(z: 40),
          child: child,
        );
      },
    );
  }
}
