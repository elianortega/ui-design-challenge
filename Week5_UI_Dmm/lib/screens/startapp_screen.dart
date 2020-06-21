import 'package:Week5_UI_Dmm/flip_animation_controller.dart';
import 'package:flutter/material.dart';

class StartAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DMM APP'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Start App'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FlipAnimationController(),
              ),
            );
          },
        ),
      ),
    );
  }
}
