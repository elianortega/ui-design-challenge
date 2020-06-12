import 'package:flutter/material.dart';
import 'home_view.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp UI'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Start App'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => HomeView(),
            ));
          },
        ),
      ),
    );
  }
}
