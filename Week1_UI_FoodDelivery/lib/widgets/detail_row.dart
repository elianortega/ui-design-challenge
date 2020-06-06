import 'package:flutter/material.dart';
import '../animations/slide_animation.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlideAnimation(
            offsetStart: Offset(-100, 0),
            offsetEnd: Offset.zero,
            curve: Curves.easeInQuint,
            durationMilliseconds: 800,
            child: _buildIconInfo(
              title: '4.5',
              icon: Icons.star,
              color: Color(0xFFEE8703),
            ),
          ),
          SlideAnimation(
            offsetStart: Offset(-100, 0),
            offsetEnd: Offset.zero,
            durationMilliseconds: 900,
            curve: Curves.easeInQuint,
            child: _buildIconInfo(
              title: '19 min',
              icon: Icons.timer,
              color: Color(0xFFF78062),
            ),
          ),
          SlideAnimation(
            offsetStart: Offset(-100, 0),
            offsetEnd: Offset.zero,
            curve: Curves.easeInQuint,
            durationMilliseconds: 1000,
            child: _buildIconInfo(
              title: '2.3 km',
              icon: Icons.map,
              color: Color(0xFFF78062),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildIconInfo({IconData icon, String title, Color color}) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(width: 5.0),
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
