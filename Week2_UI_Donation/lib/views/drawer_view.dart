import 'package:Week2_UI_Donation/constants.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Color(0xff434343),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //   icon: FaIcon(FontAwesomeIcons.arrowLeft),
              //   onPressed: () {},
              //   color: Colors.white,
              // ),
              SizedBox(height: 60.0),
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFFD7DEE4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elian Ortega',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Donator',
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 50.0),
              _listTile(
                title: 'Home',
                icon: Icons.home,
                isSelected: true,
              ),
              _listTile(
                title: 'Search Project',
                icon: Icons.search,
              ),
              _listTile(
                title: 'Goals',
                icon: Icons.track_changes,
              ),
              _listTile(
                title: 'The table',
                icon: Icons.map,
              ),
              _listTile(
                title: 'Community',
                icon: Icons.people,
              ),
              _listTile(
                title: 'Logout',
                icon: Icons.lock,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _listTile({String title, IconData icon, bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
            size: 28,
          ),
          SizedBox(width: 20.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
