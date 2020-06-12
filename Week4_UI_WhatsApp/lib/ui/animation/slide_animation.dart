import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Offset offsetStart;
  final Widget child;
  final int delay;
  final Curve curve;

  const SlideAnimation({
    Key key,
    @required this.offsetStart,
    @required this.child,
    @required this.delay,
    this.curve = Curves.easeInOut,
  }) : super(key: key);
  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: widget.curve,
      duration: Duration(milliseconds: widget.delay),
      tween: Tween<Offset>(
        begin: widget.offsetStart,
        end: Offset.zero,
      ),
      child: widget.child,
      builder: (context, animation, child) {
        return Transform.translate(
          offset: animation,
          child: child,
        );
      },
    );
  }
}
