import 'package:Week7_Medical/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              _DoctorInformation(),
              Positioned(
                right: 25.0,
                bottom: MediaQuery.of(context).size.height * .13,
                child: SvgPicture.asset(
                  'assets/images/doctor.svg',
                  height: 200,
                ),
              ),
              Positioned(
                right: 25.0,
                top: MediaQuery.of(context).size.height * .285,
                child: _FavButton(),
              ),
            ],
          ),
          _About()
        ],
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: kBlue,
        child: Text(
          'Book Appointment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 5.0),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StackText(
                title: 'Experience',
                description: '5yrs',
              ),
              _StackText(
                title: 'Ratings',
                description: '4.8',
              ),
              _StackText(
                title: 'Favourites',
                description: '180',
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Text(
            'About',
            style: kSectionTitleTextStyle,
          ),
          SizedBox(height: 10.0),
          Text(
            lorem(paragraphs: 1, words: 80),
          ),
        ],
      ),
    );
  }
}

class _StackText extends StatelessWidget {
  final String title;
  final String description;
  const _StackText({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: kBodyTextStyle.copyWith(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          description,
          style: kSectionTitleTextStyle,
        ),
      ],
    );
  }
}

class _FavButton extends StatelessWidget {
  const _FavButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.red.withOpacity(.8),
      child: Icon(
        Icons.favorite,
        color: Colors.white,
      ),
    );
  }
}

class _DoctorInformation extends StatelessWidget {
  const _DoctorInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: const BackButton(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr.Marcos Sevilla',
                    style: kSectionTitleTextStyle,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Doctor Widget',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          size: 20,
                          color: i != 4 ? Colors.amber : Colors.grey,
                        ),
                      SizedBox(width: 10.0),
                      Text('4.8'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
