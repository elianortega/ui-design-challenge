import 'package:flutter/material.dart';

import '../constants.dart';

class CreditCard extends StatelessWidget {
  final Function onPressed;
  final double width;
  final double height;
  final EdgeInsets margin;
  const CreditCard({
    Key key,
    this.onPressed,
    this.width = 230,
    this.height = 150,
    this.margin = const EdgeInsets.symmetric(horizontal: 20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Hero(
        tag: 'visaCreditCard',
        child: Container(
          margin: margin,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: CustomPaint(
            painter: _CardPainter(),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 20,
                      child: Image.network(
                        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week6_UI_Bank/assets/images/visa.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        '1234  5678  9890  1244',
                        style: kSmallTextStyle.copyWith(
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;

    var paint = Paint()
      ..color = AppColors.lightPurple
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(width - 120, height)
      ..quadraticBezierTo(width - 40, height - 40, width, height - 120)
      ..lineTo(width, height - 30)
      ..quadraticBezierTo(width - 30, height - 40, width - 90, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CardPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CardPainter oldDelegate) => false;
}
