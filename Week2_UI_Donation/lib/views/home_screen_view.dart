import 'package:Week2_UI_Donation/views/charities_view.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/cards_stack.dart';
import '../widgets/my_bottom_nav_bar.dart';

final charityEvents = [
  {
    'title': 'Educate Children around the world',
    'imgSource': 'assets/images/education2.jpeg',
  },
  {
    'title': 'Educate Children around the world',
    'imgSource': 'assets/images/education.jpeg',
  },
  {
    'title': 'Feed Children around the world',
    'imgSource': 'assets/images/charity_2.jpg',
  }
];

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                _myAppBar(),
                SizedBox(height: 20.0),
                CardsStack(),
                SizedBox(height: 5.0),
                _myBottomSection(context)
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: MyBottomNavBar(),
          )
        ],
      ),
    );
  }

  Widget _myBottomSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Learn more',
                style: TextStyle(
                  color: kBlueColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CharitiesViews()),
                  );
                },
                child: Text(
                  'All',
                  style: TextStyle(
                    color: kBlueColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ...charityEvents
              .map(
                (element) => _charityContainer(
                  imgSource: element['imgSource'],
                  title: element['title'],
                ),
              )
              .toList(),
          SizedBox(height: 70.0),
        ],
      ),
    );
  }

  Container _charityContainer({String imgSource, String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imgSource),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  color: kBlueColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Let\'s discover a charity event!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0xFFD7DEE4),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.userAlt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
