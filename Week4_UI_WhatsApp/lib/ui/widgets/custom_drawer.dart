import 'package:Week4_UI_WhatsApp/ui/shared/constants.dart';
import 'package:Week4_UI_WhatsApp/ui/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/app_colors.dart';

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
                  icon: FaIcon(
                    FontAwesomeIcons.chevronLeft,
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
            Row(
              children: [
                CustomCircleAvatar(imgSource: 'assets/images/elian.jpg'),
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
            SizedBox(height: 40.0),
            _drawerTile(
              icon: FontAwesomeIcons.key,
              title: 'Account',
            ),
            _drawerTile(
              icon: FontAwesomeIcons.comments,
              title: 'Chat',
            ),
            _drawerTile(
              icon: FontAwesomeIcons.solidBell,
              title: 'Notifications',
            ),
            _drawerTile(
              icon: FontAwesomeIcons.database,
              title: 'Data and Storage',
            ),
            _drawerTile(
              icon: FontAwesomeIcons.solidQuestionCircle,
              title: 'Help',
            ),
            Divider(
              color: AppColors.green.withOpacity(.5),
              thickness: 2,
            ),
            SizedBox(height: 20.0),
            _drawerTile(
              title: 'Invite a Friend',
              icon: FontAwesomeIcons.userFriends,
            ),
            Spacer(),
            _drawerTile(
              title: 'Log out',
              icon: FontAwesomeIcons.signOutAlt,
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
          FaIcon(
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
