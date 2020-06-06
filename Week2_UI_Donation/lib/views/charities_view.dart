import 'package:Week2_UI_Donation/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class CharitiesViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDADCDE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            top: 10.0,
          ),
          child: FaIcon(
            FontAwesomeIcons.bars,
            color: kBlueColor,
          ),
        ),
        title: Text(
          'Learn More',
          style: TextStyle(
            color: kBlueColor,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 20.0,
              top: 10.0,
            ),
            child: FaIcon(
              FontAwesomeIcons.filter,
              color: kBlueColor,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: charityEvents.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: MediaQuery.of(context).size.height * .3,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            charityEvents[index]['imgSource'],
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: kRedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Education',
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            FittedBox(
                              child: Text(
                                charityEvents[index]['title'],
                                style: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
