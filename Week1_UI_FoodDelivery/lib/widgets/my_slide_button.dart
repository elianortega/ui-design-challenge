import 'package:flutter/material.dart';

class MySlideButton extends StatefulWidget {
  @override
  _MySlideButtonState createState() => _MySlideButtonState();
}

class _MySlideButtonState extends State<MySlideButton> {
  bool addToCart = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.green,
        ),
      ),
    );
  }
}
