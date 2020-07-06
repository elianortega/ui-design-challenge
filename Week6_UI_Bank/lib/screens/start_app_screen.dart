import 'package:Week6_UI_Bank/screens/startup_screen.dart';
import 'package:flutter/material.dart';

class StartAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank App'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Start App'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => StartUpScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
