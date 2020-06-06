import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  final Widget child;
  final Offset offsetStart;
  final Offset offsetEnd;

  const BounceAnimation({Key key, this.child, this.offsetStart, this.offsetEnd})
      : super(key: key);
  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.bounceOut,
      tween: Tween<Offset>(begin: widget.offsetStart, end: widget.offsetEnd),
      duration: Duration(milliseconds: 2000),
      builder: (context, Offset offset, child) => Transform.translate(
        offset: offset,
        child: widget.child,
      ),
    );
  }
}
