import 'dart:math' as math;

import 'package:Week5_UI_Dmm/screens/bottom_navbar_controller.dart';
import 'package:Week5_UI_Dmm/screens/startup_screen.dart';
import 'package:flutter/material.dart';

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
    final startUp = StartUpScreen(toggle: toggle);
    final mainScreen = BottomNavBarController(toggle: toggle);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => IndexedStack(
        index: _animationController.value > .5 ? 0 : 1,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(math.pi + (math.pi * _animationController.value)),
            child: mainScreen,
            alignment: Alignment.center,
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(math.pi * _animationController.value),
                alignment: Alignment.center,
                child: child,
              );
            },
            child: startUp,
          ),
        ],
      ),
    );
  }
}
