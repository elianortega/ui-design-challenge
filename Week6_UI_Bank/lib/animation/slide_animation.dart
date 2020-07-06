import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  final Offset offsetStart;
  final Widget child;
  final int duration;
  final Curve curve;

  const SlideAnimation({
    Key key,
    this.offsetStart,
    this.child,
    this.duration,
    this.curve = Curves.easeInOutQuint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      curve: curve,
      duration: Duration(milliseconds: duration),
      builder: (context, value, child) => AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: value,
        child: child,
      ),
      child: TweenAnimationBuilder(
        curve: curve,
        duration: Duration(milliseconds: duration),
        tween: Tween<Offset>(
          begin: offsetStart,
          end: Offset.zero,
        ),
        builder: (context, newOffset, child) {
          return Transform.translate(
            offset: newOffset,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
