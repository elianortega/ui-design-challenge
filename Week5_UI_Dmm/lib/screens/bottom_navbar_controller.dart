import 'package:Week5_UI_Dmm/screens/home_screen.dart';
import 'package:Week5_UI_Dmm/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarController extends StatefulWidget {
  final Function toggle;
  BottomNavBarController({Key key, this.toggle}) : super(key: key);

  @override
  _BottomNavBarControllerState createState() => _BottomNavBarControllerState();
}

class _BottomNavBarControllerState extends State<BottomNavBarController> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, .9],
          colors: [
            Colors.white,
            Colors.grey[300],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          // color: Colors.red,
          alignment: Alignment.center,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarButton(
                icon: FontAwesomeIcons.chartBar,
                isSelected: _selectedIndex == 0,
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              _NavBarButton(
                icon: FontAwesomeIcons.calendar,
                isSelected: _selectedIndex == 1,
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              _NavBarButton(
                icon: FontAwesomeIcons.thermometerThreeQuarters,
                isSelected: _selectedIndex == 2,
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
              _NavBarButton(
                icon: FontAwesomeIcons.file,
                isSelected: _selectedIndex == 3,
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;
  const _NavBarButton({
    Key key,
    this.icon,
    this.onPressed,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      color: isSelected ? AppColors.purple : Colors.grey,
      icon: FaIcon(icon),
      onPressed: onPressed,
    );
  }
}
