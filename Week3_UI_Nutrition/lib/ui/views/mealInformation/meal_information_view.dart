import 'package:Week3_UI_Nutrition/ui/animations/slide_opacity_animation.dart';
import 'package:Week3_UI_Nutrition/ui/widgets/expansion_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'meal_information_viewmodel.dart';
import '../../shared/app_colors.dart';

class MealInformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<MealInformationViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            height: screenSize.height,
            child: Stack(
              children: [
                Container(
                  height: screenSize.height * .50,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/pancake.jpeg'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SlideOpacityAnimation(
                    delay: 500,
                    offsetStart: Offset(0, 100),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      height: screenSize.height * .55,
                      width: screenSize.width,
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _mealName(),
                            SizedBox(height: 10.0),
                            _calorieInfo(),
                            SizedBox(width: 30.0),
                            _dropdownList(),
                            _buttonRow(model)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => MealInformationViewModel(),
    );
  }

  Widget _mealName() {
    return SlideOpacityAnimation(
      delay: 600,
      offsetStart: Offset(0, 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NUTRITION',
            style: TextStyle(
              color: kPurpleDark,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Salad with wheat and white egg breakfast',
            style: TextStyle(
              color: Colors.black.withOpacity(.8),
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _calorieInfo() {
    return SlideOpacityAnimation(
      delay: 700,
      offsetStart: Offset(0, 100),
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.fire,
            color: kPurpleDark,
            size: 30.0,
          ),
          SizedBox(width: 10.0),
          Text(
            '345',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 5.0),
          Text(
            ' kcal',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownList() {
    return SlideOpacityAnimation(
      delay: 800,
      offsetStart: Offset(0, 100),
      child: ExpansionList<String>(
        title: 'Serving (2,000 g)',
        items: ['Serving (2,000 g)', 'Serving (3,000 g)', 'Serving (3,000 g)'],
        onItemSelected: (itemSelected) {},
      ),
    );
  }

  Widget _buttonRow(MealInformationViewModel model) {
    return SlideOpacityAnimation(
      delay: 900,
      offsetStart: Offset(0, 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kPurpleLight,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.share,
                color: kPurpleDark,
                size: 20.0,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              model.navigationPop();
            },
            child: Container(
              height: 60.0,
              width: 250,
              decoration: BoxDecoration(
                color: kPurpleDark,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'Let\'s try it!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
