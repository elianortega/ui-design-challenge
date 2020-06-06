import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/user_welcome.dart';
import '../widgets/food_options_list_view.dart';
import '../widgets/meal_options_list_view.dart';
import '../widgets/bottom_nav_bar.dart';

import '../animations/slide_animation.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 272 + 100.0,
                ),
                Container(
                  // padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                  height: 272,
                  color: Color(0xFFCFF3F3),
                ),
                Positioned(
                  top: 50.0,
                  child: Column(
                    children: [
                      SlideAnimation(
                        offsetStart: Offset(-100, 0),
                        offsetEnd: Offset.zero,
                        child: UserWelcome(),
                        curve: Curves.easeIn,
                      ),
                      SizedBox(height: 20.0),
                      SlideAnimation(
                        offsetStart: Offset(-100, 0),
                        offsetEnd: Offset.zero,
                        child: SearchBar(),
                        curve: Curves.easeIn,
                      ),
                      SlideAnimation(
                        offsetStart: Offset(100, 0),
                        offsetEnd: Offset.zero,
                        child: FoodOptionsListView(),
                        curve: Curves.easeIn,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SlideAnimation(
              offsetStart: Offset(-100, 0),
              offsetEnd: Offset.zero,
              curve: Curves.easeIn,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Foods',
                      style: TextStyle(
                        fontSize: 27.0,
                      ),
                    ),
                    Text(
                      'View All',
                      style:
                          TextStyle(fontSize: 22.0, color: Color(0xFF7FB6B3)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SlideAnimation(
              offsetStart: Offset(100, 0),
              offsetEnd: Offset.zero,
              curve: Curves.easeIn,
              child: MealOptionsListView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
