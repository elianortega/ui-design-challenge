import 'package:Week6_UI_Bank/constants.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class OutlineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      height: 150,
      width: 230,
      child: CustomPaint(
        painter: RectPainter(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: AppColors.lightBlue, size: 40),
              Text(
                'Add',
                style: kSmallTextStyle.copyWith(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(20.0),
        ),
      );

    // canvas.drawPath(path, paint);

    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[6, 5]),
        // dashOffset: DashOffset.absolute(0),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(RectPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RectPainter oldDelegate) => false;
}
