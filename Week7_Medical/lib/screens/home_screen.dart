import 'package:Week7_Medical/constants.dart';
import 'package:Week7_Medical/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'doctor_details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hi, Ciel!',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SearchBar(),
          SizedBox(height: 20.0),
          _Banner(),
          SizedBox(height: 20.0),
          _ProjectSection(),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Doctor',
              style: kSectionTitleTextStyle,
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (_, index) => _ListTileElement(index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTileElement extends StatelessWidget {
  final int index;
  const _ListTileElement({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90.0,
          margin: EdgeInsets.only(bottom: 20.0),
        ),
        Positioned(
          top: 10.0,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: kBlue,
                  blurRadius: 20.0,
                  spreadRadius: -14.0,
                ),
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 80.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dr.Widget Marcos',
                      style: kSectionTitleTextStyle.copyWith(
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'Doctor Title',
                      style: kBodyTextStyle.copyWith(
                        color: kBlue.withOpacity(.7),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        for (var i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            size: 20,
                            color: i != 4 ? Colors.amber : Colors.grey,
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: OutlineButton(
                    textColor: kBlue,
                    borderSide: BorderSide(
                      color: kBlue,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DoctorDetailsScreen(),
                        ),
                      );
                    },
                    child: Text('register'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 5.0,
          child: Container(
            height: 80,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blue[(200 * (index + 1)) % 900],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(
              Icons.person,
              color: kBlue,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectSection extends StatelessWidget {
  const _ProjectSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Project',
            style: kSectionTitleTextStyle,
          ),
        ),
        Container(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              width: 95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: kBlue,
                    blurRadius: 20.0,
                    spreadRadius: -14.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categoryList[index].icon,
                    color: kBlue,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    categoryList[index].title,
                    style: kBodyTextStyle.copyWith(
                      color: kBlue.withOpacity(.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 150,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 130,
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                height: 120,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Focus on health!',
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/images/doctor.svg',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: kBlue,
            blurRadius: 30.0,
            spreadRadius: -25.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search For ...',
          hintStyle: TextStyle(
            color: kGrey.withOpacity(.6),
          ),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: kGrey.withOpacity(.7)),
        ),
      ),
    );
  }
}
