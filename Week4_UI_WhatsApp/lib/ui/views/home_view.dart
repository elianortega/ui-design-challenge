import 'package:Week4_UI_WhatsApp/ui/shared/constants.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/app_colors.dart';

import '../widgets/selection_row.dart';
import '../widgets/favorite_contact_row.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          child: IconButton(
            padding: EdgeInsets.only(left: 20.0),
            icon: FaIcon(
              FontAwesomeIcons.bars,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20.0),
            icon: FaIcon(FontAwesomeIcons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SelectionRow(),
          SizedBox(height: 20.0),
          Expanded(
            child: Container(
              decoration: mainContainerDecoration(
                color: AppColors.green,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  _favoriteContactLabel(),
                  FavoriteContactRow(),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20.0,
                        top: 5.0,
                        bottom: 10.0,
                      ),
                      decoration: mainContainerDecoration(),
                      child: ListView(
                        children: [
                          Container(
                            height: 100,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage('assets/images/friend3.jpeg'),
                                ),
                                SizedBox(width: 20.0),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 0.5,
                                          color: Colors.grey.withOpacity(.3),
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      right: 20.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Name'),
                                            SizedBox(height: 5.0),
                                            Text('Name'),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('16:36'),
                                            Text('2'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _favoriteContactLabel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Favorite contacts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(left: 16),
            icon: Icon(
              Icons.more_horiz,
              size: 30.0,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
