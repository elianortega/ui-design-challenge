import 'package:Week3_UI_Nutrition/packages/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/meal.dart';

class PlateCarousel extends StatelessWidget {
  final List<Meal> mealList;

  const PlateCarousel({Key key, this.mealList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: mealList.length,
      itemBuilder: (context, index) {
        return Image.network(
          mealList[index].imgSource,
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.2,
        viewportFraction: .7,
        enlargeCenterPage: true,
      ),
    );
  }
}
