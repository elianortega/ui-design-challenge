import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../shared/app_colors.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        padding: EdgeInsets.only(
          left: 20.0,
          top: 5.0,
          bottom: 10.0,
        ),
        decoration: mainContainerDecoration(),
        child: ListView.builder(
          itemCount: friendsList.length,
          itemBuilder: (context, index) {
            return _messageListTile(
              name: friendsList[index].name,
              imgSource: friendsList[index].imgSource,
            );
          },
        ));
  }

  Container _messageListTile({String name, String imgSource}) {
    return Container(
      height: 100,
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imgSource),
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
                right: 30.0,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Hello, how are you!',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '16:36',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      // Text('2'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
