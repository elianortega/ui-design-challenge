import 'package:Week4_UI_WhatsApp/ui/animation/slide_animation.dart';
import 'package:Week4_UI_WhatsApp/ui/shared/constants.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/app_colors.dart';

import '../widgets/selection_row.dart';
import '../widgets/favorite_contact_row.dart';
import '../widgets/messages_list.dart';
import '../widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.black,
      appBar: _appBar(),
      body: Column(
        children: [
          SlideAnimation(
            delay: 600,
            offsetStart: Offset(200, 0),
            child: SelectionRow(),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Stack(
              children: [
                SlideAnimation(
                  delay: 700,
                  offsetStart: Offset(200, 0),
                  child: Container(
                    decoration: mainContainerDecoration(
                      color: AppColors.green,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15.0),
                        _favoriteContactLabel(),
                        SlideAnimation(
                          delay: 800,
                          offsetStart: Offset(200, 0),
                          child: FavoriteContactRow(),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
                SlideAnimation(
                  delay: 900,
                  offsetStart: Offset(0, 500),
                  child: MessagesList(),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: AppColors.green,
            child: FaIcon(
              FontAwesomeIcons.pen,
              size: 20.0,
            ),
            onPressed: () {},
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Container(
        child: IconButton(
          splashRadius: null,
          padding: EdgeInsets.only(left: 20.0),
          icon: FaIcon(
            FontAwesomeIcons.bars,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      actions: [
        IconButton(
          splashRadius: null,
          padding: EdgeInsets.only(right: 20.0),
          icon: FaIcon(FontAwesomeIcons.search),
          onPressed: () {},
        ),
      ],
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
