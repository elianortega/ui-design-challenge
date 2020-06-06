import 'package:flutter/material.dart';

class MealDetailInfo extends StatelessWidget {
  const MealDetailInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chicken Wadges',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFF78263),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Rio cafe',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '\$20.0',
                style: TextStyle(
                  color: Color(0xffF6613B),
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
