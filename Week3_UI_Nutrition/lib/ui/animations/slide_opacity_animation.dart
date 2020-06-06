import 'package:flutter/material.dart';

class SlideOpacityAnimation extends StatefulWidget {
  final Offset offsetStart;
  final int delay;
  final Widget child;

  const SlideOpacityAnimation({
    Key key,
    @required this.offsetStart,
    @required this.delay,
    @required this.child,
  }) : super(key: key);
  @override
  _SlideOpacityAnimationState createState() => _SlideOpacityAnimationState();
}

class _SlideOpacityAnimationState extends State<SlideOpacityAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.delay),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(
        begin: widget.offsetStart,
        end: Offset.zero,
      ),
      duration: Duration(milliseconds: widget.delay),
      child: widget.child,
      curve: Curves.ease,
      builder: (context, animation, child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: animation,
            child: child,
          ),
        );
      },
    );
  }
}
