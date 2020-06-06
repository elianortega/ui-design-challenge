import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/meal.dart';

class RecipeListView extends StatelessWidget {
  final List<Meal> mealList;
  final Function onPressed;

  const RecipeListView({Key key, this.mealList, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mealList.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1.8 / 1,
          child: GestureDetector(
            onTap: onPressed,
            child: RecipeCard(
              mealName: mealList[index].name,
              imgSource: mealList[index].imgSource,
              calories: mealList[index].calories,
            ),
          ),
        );
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imgSource;
  final String mealName;
  final int calories;

  const RecipeCard({
    Key key,
    @required this.imgSource,
    @required this.mealName,
    @required this.calories,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: 20.0,
        bottom: 20.0,
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -140,
            top: -50,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    spreadRadius: -15.0,
                    blurRadius: 30,
                  )
                ],
              ),
              child: Image.asset(
                imgSource,
                height: 250,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(0.0),
                  icon: FaIcon(
                    FontAwesomeIcons.solidBookmark,
                    color: Colors.grey.withOpacity(.7),
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 150,
                  child: Text(
                    mealName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '$calories cals',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(.7),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
