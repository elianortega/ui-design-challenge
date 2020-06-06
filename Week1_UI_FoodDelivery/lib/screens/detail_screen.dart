import 'package:flutter/material.dart';
import 'package:slide_button/slide_button.dart';

import '../widgets/meal_display.dart';
import '../widgets/detail_row.dart';
import '../widgets/meal_detail_info.dart';
import '../widgets/meal_overview.dart';
import '../widgets/my_slide_button.dart';

import '../animations/slide_animation.dart';

class DetailScreen extends StatelessWidget {
  static const String id = '/detail-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MealDisplay(
                  imagePath: 'assets/images/meal2.png',
                ),
                SizedBox(height: 20.0),
                SlideAnimation(
                  offsetStart: Offset(0, 100),
                  offsetEnd: Offset.zero,
                  durationMilliseconds: 700,
                  child: MealDetailInfo(),
                ),
                SizedBox(height: 20.0),
                SlideAnimation(
                    offsetStart: Offset(0, 100),
                    offsetEnd: Offset.zero,
                    durationMilliseconds: 800,
                    child: DetailRow()),
                SizedBox(height: 20.0),
                SlideAnimation(
                    offsetStart: Offset(0, 100),
                    offsetEnd: Offset.zero,
                    durationMilliseconds: 900,
                    child: MealOverview()),
              ],
            ),
            Positioned(
              top: 310.0,
              right: 20.0,
              child: SlideAnimation(
                offsetStart: Offset(-40, 0),
                offsetEnd: Offset.zero,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFED5456),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: MySlideButton(),
      ),
    );
  }
}
