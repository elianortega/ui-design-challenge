import 'package:Week4_UI_WhatsApp/ui/shared/constants.dart';
import 'package:Week4_UI_WhatsApp/ui/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/app_colors.dart';
import '../animation/slide_animation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width * .75,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: AppColors.black.withOpacity(.95),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          )),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            SlideAnimation(
              delay: 500,
              curve: Curves.easeInOutBack,
              offsetStart: Offset(-200, 0),
              child: Row(
                children: [
                  CustomCircleAvatar(
                      imgSource:
                          'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/elian.jpg'),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Elian Ortega',
                        style: kDrawerTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            SlideAnimation(
              delay: 300,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                icon: Icons.security,
                title: 'Account',
              ),
            ),
            SlideAnimation(
              delay: 400,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                icon: Icons.mode_comment,
                title: 'Chat',
              ),
            ),
            SlideAnimation(
              delay: 500,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                icon: Icons.notifications,
                title: 'Notifications',
              ),
            ),
            SlideAnimation(
              delay: 600,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                icon: Icons.storage,
                title: 'Data and Storage',
              ),
            ),
            SlideAnimation(
              delay: 700,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                icon: Icons.help,
                title: 'Help',
              ),
            ),
            SlideAnimation(
              delay: 750,
              offsetStart: Offset(-100, 100),
              child: Divider(
                color: AppColors.green.withOpacity(.5),
                thickness: 2,
              ),
            ),
            SizedBox(height: 20.0),
            SlideAnimation(
              delay: 800,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                title: 'Invite a Friend',
                icon: Icons.people,
              ),
            ),
            Spacer(),
            SlideAnimation(
              delay: 900,
              offsetStart: Offset(-100, 100),
              child: _drawerTile(
                title: 'Log out',
                icon: Icons.lock,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _drawerTile({@required String title, @required IconData icon}) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 50.0),
          Text(
            title,
            style: kDrawerTextStyle,
          ),
        ],
      ),
    );
  }
}
