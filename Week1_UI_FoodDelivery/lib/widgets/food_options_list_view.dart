import 'package:flutter/material.dart';

class FoodOptionsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FoodOptionCard(
            title: 'Pizzas',
            imagePath: 'assets/images/pizza.png',
          ),
          FoodOptionCard(
            title: 'Salad',
            imagePath: 'assets/images/salad.png',
          ),
          FoodOptionCard(
            title: 'Shake',
            imagePath: 'assets/images/shake.png',
          ),
        ],
      ),
    );
  }
}

class FoodOptionCard extends StatelessWidget {
  final String title;
  final String imagePath;
  const FoodOptionCard({
    Key key,
    this.title,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .83,
      child: Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: 60,
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
