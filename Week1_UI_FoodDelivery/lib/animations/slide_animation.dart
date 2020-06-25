import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Offset offsetStart;
  final Offset offsetEnd;
  final int durationMilliseconds;
  final Curve curve;
  final int wait;

  const SlideAnimation(
      {Key key,
      this.child,
      this.offsetStart,
      this.offsetEnd,
      this.durationMilliseconds = 1000,
      this.curve = Curves.ease,
      this.wait = 0})
      : super(key: key);
  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  // startTime() async {
  //   var duration = new Duration(milliseconds: widget.wait);
  //   return new Timer(duration, route);
  // }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: widget.curve,
      tween: Tween<Offset>(begin: widget.offsetStart, end: widget.offsetEnd),
      duration: Duration(milliseconds: widget.durationMilliseconds),
      builder: (context, Offset offset, child) => Transform.translate(
        offset: offset,
        child: widget.child,
      ),
    );
  }
}
