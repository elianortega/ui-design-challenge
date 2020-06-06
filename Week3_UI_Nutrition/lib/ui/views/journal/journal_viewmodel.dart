import 'package:Week3_UI_Nutrition/models/meal_time.dart';

import '../../../constants.dart';
import '../../../models/meal.dart';
import 'package:stacked/stacked.dart';

class JournalViewModel extends BaseViewModel {
  List<Meal> _mealList = globalMealList;
  List<Meal> get mealList => _mealList;

  List<MealTime> get mealTimes => [
        MealTime(
          name: 'BREAKFAST',
          kcalories: 120,
          meals: _mealList.sublist(0, 2),
        ),
        MealTime(
          name: 'LUNCH',
          kcalories: 715,
          meals: _mealList.sublist(1, 3),
        ),
      ];
}
