import 'package:Week3_UI_Nutrition/models/meal.dart';
import 'package:Week3_UI_Nutrition/packages/circular_percent_indicator.dart';
import 'package:Week3_UI_Nutrition/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class NutritionalFacts extends StatelessWidget {
  final Meal meal;

  const NutritionalFacts({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nutrition Fact',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            _percentageRow(),
            SizedBox(height: 20.0),
            _primaryDetail(
              title: 'Protein',
              grams: 4,
              color: kPurpleColor,
            ),
            _primaryDetail(
              title: 'Carbs',
              grams: 44,
              color: kTealColor,
              includeDivider: false,
            ),
            _secondaryDetail(
              title: 'Fibers',
              grams: 4,
            ),
            _secondaryDetail(
              title: 'Sugars',
              grams: 20,
            ),
            _primaryDetail(
              title: 'Fats',
              grams: 44,
              color: kBlueColor,
              includeDivider: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _primaryDetail({String title, Color color, int grams, bool includeDivider = true}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: color,
                ),
                height: 20,
                width: 20,
              ),
              SizedBox(width: 10.0),
              Text(
                title,
                style: new TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                '$grams g',
                style: new TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        includeDivider ? Divider() : SizedBox(),
      ],
    );
  }
}

Widget _secondaryDetail({String title, int grams, bool includeDivider = true}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Text(
                title,
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                '$grams g',
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        includeDivider ? Divider() : SizedBox(),
      ],
    ),
  );
}

Widget _percentageRow() {
  return Container(
    // height: 200,
    width: double.infinity,
    child: Row(
      children: [
        _progressIndicator(
          progressColor: kTealColor,
          backgroundColor: kTealLight,
          title: 'Carbs',
          percent: .78,
        ),
        SizedBox(width: 10.0),
        _progressIndicator(
          progressColor: kPurpleColor,
          backgroundColor: kPurpleLight,
          title: 'Protein',
          percent: .13,
        ),
        SizedBox(width: 10.0),
        _progressIndicator(
          progressColor: kBlueColor,
          backgroundColor: kBlueLight,
          title: 'Fat',
          percent: .09,
        ),
      ],
    ),
  );
}

Widget _progressIndicator(
    {Color backgroundColor, Color progressColor, String title, double percent}) {
  return Expanded(
    child: CircularPercentIndicator(
      radius: 110.0,
      lineWidth: 13.0,
      animation: true,
      percent: percent,
      center: new Text(
        "${(percent * 100).toStringAsFixed(0)}%",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      footer: new Text(
        title,
        style: new TextStyle(
          fontSize: 17.0,
          color: Colors.black,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
    ),
  );
}
