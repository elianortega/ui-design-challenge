import 'package:Week3_UI_Nutrition/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

import '../../ui/widgets/my_date_picker_widget.dart';

class MyDatePicker extends StatefulWidget {
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    var _selectedValue;
    return MyDatePickerWidget(
      DateTime.now(),
      width: 55.0,
      height: 90,
      daysCount: 14,
      initialSelectedDate: DateTime.now(),
      selectionColor: kPurpleDark,
      selectedTextColor: Colors.white,
      dayTextStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: kPurpleLight,
      ),
      dateTextStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      onDateChange: (date) {
        // New date selected
        setState(() {
          _selectedValue = date;
        });
      },
    );
  }
}
