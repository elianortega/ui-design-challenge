import 'package:Week4_UI_WhatsApp/ui/shared/constants.dart';
import 'package:flutter/material.dart';

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
          Container(
            padding: EdgeInsets.all(2.7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(imgSource),
            ),
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
