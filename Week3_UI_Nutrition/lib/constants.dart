import 'models/meal.dart';

List<Meal> globalMealList = [
  Meal(
    name: 'Salad with wheat and white egg',
    imgSource: 'assets/images/plate1.png',
    calories: 200,
    protein: 78,
    carbs: 13,
    fat: 9,
    mealType: MealType.Good,
  ),
  Meal(
    name: 'Pumplin Soup',
    imgSource: 'assets/images/plate2.png',
    calories: 300,
    protein: 78,
    carbs: 13,
    fat: 9,
    mealType: MealType.Normal,
  ),
  Meal(
    name: 'Mango and avocado salad',
    imgSource: 'assets/images/plate3.png',
    calories: 150,
    protein: 78,
    carbs: 13,
    fat: 9,
    mealType: MealType.Bad,
  ),
];
