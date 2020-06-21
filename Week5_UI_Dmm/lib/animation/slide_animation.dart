import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Offset offset;
  final Widget child;
  final int delay;
  final Curve curve;

  const SlideAnimation({
    Key key,
    @required this.offset,
    @required this.child,
    this.delay = 500,
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  Future<void> delay() async {}

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: widget.curve,
      duration: Duration(milliseconds: widget.delay),
      tween: Tween<Offset>(
        begin: widget.offset,
        end: Offset.zero,
      ),
      child: widget.child,
      builder: (context, animation, child) {
        return TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          duration: Duration(milliseconds: widget.delay),
          builder: (context, animatedOpacity, _) {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 1),
              opacity: animatedOpacity,
              child: Transform.translate(
                offset: animation,
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
