import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(
          'assets/images/camera.png',
        ),
        Image.asset(
          'assets/images/camera.png',
        ),
        Image.asset(
          'assets/images/camera.png',
        ),
      ],
      // itemCount: mealList.length,
      // itemBuilder: (context, index) {
      //   return Image.asset(
      //     mealList[index].imgSource,
      //   );
      // },
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.2,
        viewportFraction: .65,
        enlargeCenterPage: true,
      ),
    );
  }
}
