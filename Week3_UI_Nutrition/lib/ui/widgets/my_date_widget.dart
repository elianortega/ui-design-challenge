/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

// import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:Week3_UI_Nutrition/ui/shared/app_colors.dart'; //Added by Me

class MyDateWidget extends StatelessWidget {
  final double width;
  final DateTime date;
  final TextStyle monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  // final DateSelectionCallback onDateSelected;
  final String locale;

  final bool isSelected; //My Addition

  MyDateWidget({
    @required this.date,
    @required this.monthTextStyle,
    @required this.dayTextStyle,
    @required this.dateTextStyle,
    @required this.selectionColor,
    @required this.isSelected, //My Addition
    this.width,
    // this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: selectionColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.spaceAround, //My Addition
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(new DateFormat("E", locale).format(date).toUpperCase(),
                  // WeekDay
                  style: dayTextStyle),
              SizedBox(height: 10.0),
              Container(
                height: 30,
                // margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.white : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    date.day.toString(), // Date
                    style: dateTextStyle.apply(
                      color: isSelected ? kPurpleDark : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        // if (onDateSelected != null) {
        //   // Call the onDateSelected Function
        //   onDateSelected(this.date);
        // }
      },
    );
  }
}
