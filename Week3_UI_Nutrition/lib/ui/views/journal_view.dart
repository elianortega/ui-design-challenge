import 'package:Week3_UI_Nutrition/constants.dart';
import 'package:Week3_UI_Nutrition/models/meal_time.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/app_colors.dart';
import '../widgets/my_date_picker.dart';
import '../widgets/meal_time_card.dart';

import '../animations/slide_opacity_animation.dart';

List<MealTime> get mealTimes => [
      MealTime(
        name: 'BREAKFAST',
        kcalories: 120,
        meals: globalMealList.sublist(0, 2),
      ),
      MealTime(
        name: 'LUNCH',
        kcalories: 715,
        meals: globalMealList.sublist(1, 3),
      ),
    ];

class JournalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurpleColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPurpleColor,
        title: Text('Journal'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SlideOpacityAnimation(
              delay: 600,
              offsetStart: Offset(-100, 0),
              child: MyDatePicker(),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kScaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    _textField(),
                    SizedBox(height: 10.0),
                    ...mealTimes
                        .map(
                          (mealTime) => MealTimeCard(
                            mealTimeName: mealTime.name,
                            meals: mealTime.meals,
                            kCalories: mealTime.kcalories,
                          ),
                        )
                        .toList(),

                    // Column.builder(
                    //   itemCount: model.mealTimes.length,
                    //   itemBuilder: (context, index) {
                    //     return MealTimeCard();
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textField() {
    return SlideOpacityAnimation(
      delay: 700,
      offsetStart: Offset(0, 100),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              spreadRadius: -18.0,
            )
          ],
        ),
        child: TextField(
          cursorColor: kPurpleColor,
          style: TextStyle(
            color: Colors.black.withOpacity(.7),
          ),
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              size: 20,
              color: Colors.grey.withOpacity(.7),
            ),
            border: InputBorder.none,
            hintText: 'Search meal..',
            alignLabelWithHint: false,
            hintStyle: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
