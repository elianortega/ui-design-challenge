import 'package:UI_FoodDelivery/dummy_data.dart';
import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class MealOptionsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: DummyData.mealOptions
            .map(
              (mealItem) => MealInfoCard(
                name: mealItem.name,
                location: mealItem.location,
                price: mealItem.price,
                imagePath: mealItem.imagePath,
                onPressed: () {
                  Navigator.pushNamed(context, DetailScreen.id);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class MealInfoCard extends StatelessWidget {
  final int index;
  final String name;
  final String location;
  final double price;
  final String imagePath;
  final Function onPressed;
  const MealInfoCard({
    Key key,
    this.name,
    this.location,
    this.price,
    this.imagePath,
    this.onPressed,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .75,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
                top: 90.0,
              ),
              margin: EdgeInsets.only(
                left: 20.0,
                top: 60.0,
                bottom: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    spreadRadius: -13,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFF78263),
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  _RaitingBar(),
                  Text(
                    '\$${price.toString()}',
                    style: TextStyle(
                      color: Color(0xffF6613B),
                      fontSize: 27.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Hero(
            tag: '${DateTime.now()} hero$imagePath',
            child: Image.network(
              imagePath,
              width: 150.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _RaitingBar extends StatelessWidget {
  const _RaitingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
