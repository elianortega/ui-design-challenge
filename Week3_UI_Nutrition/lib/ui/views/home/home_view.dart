import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

import '../../shared/app_colors.dart';

import '../../widgets/plate_carousel.dart';
import '../../widgets/recipe_list_view.dart';

import '../../animations/slide_opacity_animation.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: kScaffoldBackgroundColor,
          body: Column(
            children: [
              Container(
                height: screenSize.height * .62,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  color: kPurpleColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _dailyBar(),
                    _mealSlider(screenSize, model),
                    _bottomButtons(context, model),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              _newRecipeBar(),
              SizedBox(height: 10.0),
              _recipeListView(screenSize, model)
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget _recipeListView(Size screenSize, HomeViewModel model) {
    return SlideOpacityAnimation(
      delay: 700,
      offsetStart: Offset(-100, 0),
      child: Container(
        height: screenSize.height * .23,
        width: double.infinity,
        child: RecipeListView(
          mealList: model.mealList,
          onPressed: model.navigateToMealInformation,
        ),
      ),
    );
  }

  Widget _newRecipeBar() {
    return SlideOpacityAnimation(
      delay: 700,
      offsetStart: Offset(-100, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New recipe',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.ellipsisH,
                color: Colors.grey.withOpacity(.7),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomButtons(BuildContext context, HomeViewModel model) {
    return Expanded(
      child: SlideOpacityAnimation(
        delay: 700,
        offsetStart: Offset(100, 0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start your day off right with these healthy breakfast recipies.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: kPurpleDark,
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => model.navigateToJournal(),
                    // onPressed: () =>
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (ctx) => JournalView(),
                    // )),
                    child: Container(
                      height: 60.0,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          'Let\'s try it!',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: kPurpleDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mealSlider(Size screenSize, HomeViewModel model) {
    return SlideOpacityAnimation(
      delay: 600,
      offsetStart: Offset(0, 100),
      child: Container(
        height: screenSize.height * .25,
        // color: Colors.red,
        child: PlateCarousel(mealList: model.mealList),
      ),
    );
  }

  Widget _dailyBar() {
    return Expanded(
      child: SlideOpacityAnimation(
        delay: 500,
        offsetStart: Offset(0, 100),
        child: Container(
          alignment: Alignment.center,
          // height: screenSize.height * .175,
          padding: EdgeInsets.only(top: 70.0),
          child: Column(
            children: [
              Text(
                'DAILY PICK',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 13.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Breakfast ideas',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
