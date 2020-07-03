import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Container(
                color: Colors.yellow,
                width: constraints.widthConstraints().maxWidth,
                height: constraints.heightConstraints().maxHeight,
                child: CustomPaint(
                  painter: FaceOutlinePainter(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;

    final redPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        200,
        200,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FaceOutlinePainter oldDelegate) => false;
}
