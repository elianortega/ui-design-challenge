import 'package:flutter/material.dart';
import 'dart:math' as math;

class MealDisplay extends StatelessWidget {
  final String imagePath;
  const MealDisplay({
    Key key,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.0,
      decoration: BoxDecoration(
        color: Color(0xFFFfF5FA),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: -40,
            bottom: 20,
            height: 180,
            child: Image.asset(
              'assets/images/fork.png',
            ),
          ),
          Positioned(
            right: -100,
            bottom: 0,
            height: 240,
            child: Transform.rotate(
              angle: math.pi / -8,
              child: Image.asset(
                'assets/images/knife.png',
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20.0,
            child: Container(
              // padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    spreadRadius: -13.0,
                  )
                ],
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.grey,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Positioned(
            top: 80,
            width: MediaQuery.of(context).size.width * .6,
            child: Hero(
              tag: 'hero${imagePath}',
              child: Image.asset(
                '${imagePath}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
