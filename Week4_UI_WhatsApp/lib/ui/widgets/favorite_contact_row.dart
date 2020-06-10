import 'package:Week4_UI_WhatsApp/ui/shared/constants.dart';
import 'package:flutter/material.dart';

import 'custom_circle_avatar.dart';

class FavoriteContactRow extends StatelessWidget {
  const FavoriteContactRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: friendsList.length,
        itemBuilder: (context, index) {
          return _favoriteContact(
              name: friendsList[index].name,
              imgSource: friendsList[index].imgSource);
        },
      ),
    );
  }

  Widget _favoriteContact({@required String name, @required String imgSource}) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          CustomCircleAvatar(
            imgSource: imgSource,
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
