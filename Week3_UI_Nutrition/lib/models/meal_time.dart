import 'package:Week3_UI_Nutrition/models/meal.dart';
import 'package:flutter/foundation.dart';

class MealTime {
  final String name;
  final int kcalories;
  final List<Meal> meals;

  MealTime({
    @required this.name,
    @required this.kcalories,
    @required this.meals,
  });
}
