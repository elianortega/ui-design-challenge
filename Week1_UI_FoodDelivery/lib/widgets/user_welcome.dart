import 'package:flutter/material.dart';

class UserWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFFE7C3AD),
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        SizedBox(width: 20.0),
        Text(
          'How Hungry are You Today ?',
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ],
    );
  }
}
