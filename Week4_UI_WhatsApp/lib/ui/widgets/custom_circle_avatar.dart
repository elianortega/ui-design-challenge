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
    return Container(
      padding: withBorder ? EdgeInsets.all(2.7) : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(imgSource),
      ),
    );
  }
}
