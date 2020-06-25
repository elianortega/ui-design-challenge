import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants.dart';

class CharityEventCard extends StatelessWidget {
  const CharityEventCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10.0, left: 20.0),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        // width: MediaQuery.of(context).size.width * .77,
        // height: MediaQuery.of(context).size.height * .57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          // color: Colors.red,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/charity_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Stack(
                  children: [
                    FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              'Feed Children around the world',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                size: 15.0,
                                color: Color(0xff7D8A99),
                              ),
                              SizedBox(width: 10.0),
                              FittedBox(
                                child: Text(
                                  'Worldwide',
                                  style: TextStyle(
                                    color: kGreyColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      'RAISED OF',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: kGreyColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  FittedBox(
                                    child: Text(
                                      '\$3,340,500',
                                      style: TextStyle(
                                        color: kBlueColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      print('pressed');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircularPercentIndicator(
                        radius: 40,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 3.0,
                        center: Text(
                          '7.8',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: kRedColor,
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.grey,
                        percent: .78,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
