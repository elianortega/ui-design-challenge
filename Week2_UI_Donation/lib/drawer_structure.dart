import 'package:Week2_UI_Donation/views/drawer_view.dart';
import 'package:Week2_UI_Donation/views/home_screen_view.dart';
import 'package:flutter/material.dart';

class DrawerStructure extends StatefulWidget {
  @override
  _DrawerStructureState createState() => _DrawerStructureState();
}

class _DrawerStructureState extends State<DrawerStructure>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _canBeDragged = true;
  final maxSlide = 250.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  // void toggle() => _animationController.isDismissed
  //     ? _animationController.forward()
  //     : _animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        _animationController.isDismissed && details.globalPosition.dx < 150;

    bool isDragOpenFromRight =
        _animationController.isCompleted && details.globalPosition.dx > 150;

    _canBeDragged = isDragOpenFromLeft || isDragOpenFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final myDrawer = Container(color: Colors.blue);
    final myChild = Container(color: Colors.yellow);
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      // onTap: toggle,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            double slide = maxSlide * _animationController.value;
            double scale = 1 - (_animationController.value * 0.27);
            return Stack(
              children: [
                DrawerView(),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: HomeScreenView(),
                ),
              ],
            );
          }),
    );
  }
}
