import 'package:flutter/material.dart';

class MealOverview extends StatelessWidget {
  const MealOverview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta blandit fermentum. Suspendisse eu purus ex. Duis pulvinar augue ac dolor varius hendrerit. Sed rutrum neque porttitor mauris suscipit, at cursus leo eleifend. Phasellus sollicitudin erat eu eleifend laoreet.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              height: 1.5,
              fontSize: 18.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
