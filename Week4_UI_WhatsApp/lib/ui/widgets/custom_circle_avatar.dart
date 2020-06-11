import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final bool withBorder;
  final String imgSource;
  const CustomCircleAvatar({
    Key key,
    this.withBorder = true,
    @required this.imgSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShakeAnimatedWidget(
      enabled: false,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      shakeAngle: Rotation.deg(z: 20),
      child: Container(
        padding: withBorder ? EdgeInsets.all(2.7) : EdgeInsets.zero,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(imgSource),
        ),
      ),
    );
  }
}
