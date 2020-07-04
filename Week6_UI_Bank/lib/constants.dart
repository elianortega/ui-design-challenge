import 'package:flutter/material.dart';

class AppColors {
  static const purple = Color(0xff700B5B);
  static const lightPurple = Color(0xff781764);

  static const pink = Color(0xffEE316B);
  static const lightPink = Color(0xffF0487C);

  static const lightBlue = Color(0xff4DD7E5);
}

const kBigTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: AppColors.purple,
);

const kMediumTextStyle = TextStyle(
  fontSize: 22.0,
  color: AppColors.lightBlue,
  height: 1.5,
  fontWeight: FontWeight.bold,
);

const kSmallTextStyle = TextStyle(
  fontSize: 15.0,
  color: AppColors.lightBlue,
  height: 1.5,
  fontWeight: FontWeight.bold,
);
