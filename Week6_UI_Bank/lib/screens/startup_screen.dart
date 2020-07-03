import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_screen.dart';

class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    icon: Icon(Icons.arrow_forward_ios),
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
    );
  }
}
