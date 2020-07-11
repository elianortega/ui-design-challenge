import 'models/meal.dart';

List<Meal> globalMealList = [
  Meal(
    name: 'Salad with wheat \nand white egg',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week3_UI_Nutrition/assets/images/plate1.png',
    calories: 200,
    protein: 78,
    carbs: 13,
    fat: 9,
    mealType: MealType.Good,
  ),
  Meal(
    name: 'Pumplin \nSoup',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week3_UI_Nutrition/assets/images/plate2.png',
    calories: 300,
    protein: 78,
    carbs: 13,
    fat: 9,
    mealType: MealType.Normal,
  ),
  Meal(
    name: 'Mango and avocado \nsalad',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week3_UI_Nutrition/assets/images/plate3.png',
    calories: 150,
    protein: 78,
    carbs: 13,
    fat: 9,
    mealType: MealType.Bad,
  ),
];
