import 'package:Week6_UI_Bank/animation/slide_animation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TimeButtons extends StatefulWidget {
  const TimeButtons({
    Key key,
  }) : super(key: key);

  @override
  _TimeButtonsState createState() => _TimeButtonsState();
}

class _TimeButtonsState extends State<TimeButtons> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      offsetStart: Offset(0, 200),
      duration: 600,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TimeButton(
              title: 'Day',
              selected: selectedIndex == 0,
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            _TimeButton(
              title: 'Week',
              selected: selectedIndex == 1,
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            _TimeButton(
              title: 'Month',
              selected: selectedIndex == 2,
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            _TimeButton(
              title: 'Year',
              selected: selectedIndex == 3,
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeButton extends StatelessWidget {
  final String title;
  final bool selected;
  final Function onPressed;
  const _TimeButton({
    Key key,
    this.title,
    this.selected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: selected ? AppColors.purple : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          title,
          style: kSmallTextStyle.copyWith(
            color: selected ? Colors.white : AppColors.lightPurple,
          ),
        ),
      ),
    );
  }
}
