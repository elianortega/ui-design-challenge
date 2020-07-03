import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

import '../constants.dart';
import 'home_screen.dart';

class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: _StartUpPainter(),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.network(
                    'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week6_UI_Bank/assets/images/startup_screen.png'),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stay Secure',
                        style: kBigTextStyle,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dignissim ut lacus.',
                        style: kSmallTextStyle,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 20),
                  child: Row(
                    children: [
                      Text(
                        'Skip',
                        style: kSmallTextStyle,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StartUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;
    Paint paint = Paint()
      ..color = AppColors.purple
      ..style = PaintingStyle.fill;
    // ..strokeWidth = 2;

    Paint paint2 = Paint()
      ..color = AppColors.pink
      ..style = PaintingStyle.fill;
    // ..strokeWidth = 2;

    Path topPurple = Path()
      ..lineTo(0, 150)
      ..quadraticBezierTo(120, 75, 130, 0);

    Path topPink = Path()
      ..lineTo(0, 220)
      ..quadraticBezierTo(70, 120, 150, 90)
      ..quadraticBezierTo(260, 40, 250, 0);

    Path bottomPurple = Path()
      ..moveTo(width, height)
      ..lineTo(width - 280, height)
      ..quadraticBezierTo(width - 275, height - 100, width, height - 175);

    Path bottomPink = Path()
      ..moveTo(width, height)
      ..lineTo(width - 175, height)
      ..quadraticBezierTo(width - 100, height - 130, width, height - 100);

    canvas.drawPath(topPink, paint2);
    canvas.drawPath(topPurple, paint);
    canvas.drawPath(bottomPurple, paint);
    canvas.drawPath(bottomPink, paint2);
  }

  @override
  bool shouldRepaint(_StartUpPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_StartUpPainter oldDelegate) => false;
}
