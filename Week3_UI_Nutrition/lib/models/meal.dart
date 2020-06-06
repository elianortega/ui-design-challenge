import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MealType {
  Good,
  Normal,
  Bad,
}

class Meal {
  final String name;
  final String imgSource;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final MealType mealType;

  Meal({
    @required this.name,
    @required this.imgSource,
    @required this.calories,
    @required this.protein,
    @required this.carbs,
    @required this.fat,
    @required this.mealType,
  });

  FaIcon get icon {
    if (mealType == MealType.Good) {
      return FaIcon(
        FontAwesomeIcons.solidGrin,
        color: Colors.blue[100],
      );
    } else if (mealType == MealType.Normal) {
      return FaIcon(
        FontAwesomeIcons.solidMeh,
        color: Colors.grey[300],
      );
    }

    return FaIcon(
      FontAwesomeIcons.solidFrown,
      color: Colors.red[200],
    );
  }
}
