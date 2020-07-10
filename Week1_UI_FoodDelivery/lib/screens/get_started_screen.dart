import 'package:flutter/material.dart';

import '../animations/slide_animation.dart';
import '../screens/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static const String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 50,
            left: 50,
            child: SlideAnimation(
              offsetStart: Offset(100, 0),
              offsetEnd: Offset.zero,
              curve: Curves.elasticOut,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: -200,
            child: SlideAnimation(
              offsetStart: Offset(-100, 0),
              offsetEnd: Offset.zero,
              curve: Curves.elasticOut,
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.05),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 30.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SlideAnimation(
                      offsetStart: Offset(-100, 0),
                      durationMilliseconds: 700,
                      offsetEnd: Offset.zero,
                      child: Text(
                        'Get the Fastest\nDelivery',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SlideAnimation(
                      offsetStart: Offset(-100, 0),
                      durationMilliseconds: 800,
                      offsetEnd: Offset.zero,
                      child: Text(
                        'Order food and get \ndelivery with the fastest time in town',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    SlideAnimation(
                      offsetStart: Offset(-100, 0),
                      durationMilliseconds: 700,
                      offsetEnd: Offset.zero,
                      child: Container(
                        width: 180.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6753C),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: FlatButton(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(HomeScreen.id);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    SlideAnimation(
                      offsetStart: Offset(200, 0),
                      durationMilliseconds: 800,
                      offsetEnd: Offset.zero,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500, minWidth: 0.0),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/images/delivery.png',
                            // width: 200,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
