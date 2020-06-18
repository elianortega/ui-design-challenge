import 'package:Week5_UI_Dmm/views/startup_view.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipAnimationController extends StatefulWidget {
  @override
  _FlipAnimationControllerState createState() =>
      _FlipAnimationControllerState();
}

class _FlipAnimationControllerState extends State<FlipAnimationController>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int stackIndex = 1;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    super.initState();
  }

  void toggle() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  // final principal = Scaffold(
  //   backgroundColor: Colors.green,
  //   appBar: AppBar(title: Text('Principal')),
  // );

  Widget build(BuildContext context) {
    final startUp = StartUpView(toggle: toggle);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => IndexedStack(
        index: _animationController.value > .5 ? 0 : 1,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(math.pi + (math.pi * _animationController.value)),
            child: SecondScreen(
              toggle: toggle,
            ),
            alignment: Alignment.center,
          ),
          AnimatedBuilder(
            animation: _animationController,
            child: startUp,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(math.pi * _animationController.value),
                child: child,
                alignment: Alignment.center,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final Function toggle;

  const SecondScreen({Key key, this.toggle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('This will be the second Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: toggle,
        ),
      ),
    );
  }
}
