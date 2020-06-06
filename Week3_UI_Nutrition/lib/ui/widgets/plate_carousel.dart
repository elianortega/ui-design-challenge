import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../models/meal.dart';

class PlateCarousel extends StatelessWidget {
  final List<Meal> mealList;

  const PlateCarousel({Key key, this.mealList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: mealList.length,
      itemBuilder: (context, index) {
        return Image.asset(
          mealList[index].imgSource,
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.2,
        viewportFraction: .6,
        enlargeCenterPage: true,
      ),
    );
  }
}
