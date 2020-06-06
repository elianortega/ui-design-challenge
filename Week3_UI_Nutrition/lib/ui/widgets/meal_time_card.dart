import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/meal.dart';
import '../shared/app_colors.dart';
import '../widgets/nutritional_facts.dart';

import '../animations/slide_opacity_animation.dart';

class MealTimeCard extends StatelessWidget {
  final String mealTimeName;
  final int kCalories;
  final List<Meal> meals;
  const MealTimeCard({
    Key key,
    @required this.mealTimeName,
    @required this.kCalories,
    @required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideOpacityAnimation(
      delay: 800,
      offsetStart: Offset(0, 100),
      child: Card(
        margin: EdgeInsets.only(bottom: 30.0),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              _mealTimeInfo(
                mealTimeName: mealTimeName,
                calories: kCalories,
              ),
              SizedBox(height: 5.0),
              Divider(),
              ...meals
                  .map(
                    (meal) => _mealTile(context, meal),
                  )
                  .toList(),
              _mealExtraInfo()
            ],
          ),
        ),
      ),
    );
  }

  Container _mealExtraInfo() {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your pumpkin soup is high on carb. Try to substitute..',
                  style: TextStyle(
                    fontSize: 15.0,
                    height: 1.5,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Read more',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: kPurpleDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              child: Image.asset(
                'assets/images/doctor.png',
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mealTile(BuildContext context, Meal meal) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          // isScrollControlled: true,
          context: context,
          builder: (context) {
            return NutritionalFacts(meal: meal);
          },
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 110,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: kPurpleLight,
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(meal.imgSource)),
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: meal.icon,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.0),
                Container(
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${meal.calories} cals',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(.7),
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Row _mealTimeInfo({String mealTimeName, int calories}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealTimeName,
              style: TextStyle(
                color: kPurpleDark,
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.fire,
                  color: kPurpleDark,
                  size: 20.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  calories.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  ' kcal / 450kcal',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: kPurpleLight,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.add,
                color: kPurpleDark,
                size: 30.0,
              ),
              onPressed: null,
            ),
          ),
        )
      ],
    );
  }
}
