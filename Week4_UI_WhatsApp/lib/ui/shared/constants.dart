import 'package:flutter/material.dart';

import '../model/friend.dart';

BoxDecoration mainContainerDecoration({Color color = Colors.white}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40.0),
      topRight: Radius.circular(40.0),
    ),
  );
}

enum MessageType {
  Text,
  Image,
  Audio,
}

const kPreviewMessageTextStyle = TextStyle(
  fontSize: 18.0,
);

const kDrawerTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
);

final List<Friend> friendsList = [
  Friend(
    name: 'Alla',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend1.jpeg',
  ),
  Friend(
    name: 'July',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend2.jpeg',
  ),
  Friend(
    name: 'Mikle',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend3.jpeg',
  ),
  Friend(
    name: 'Kler',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend4.jpeg',
  ),
  Friend(
    name: 'Mary',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend5.jpeg',
  ),
  Friend(
    name: 'Louren',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend6.jpeg',
  ),
  Friend(
    name: 'Helen',
    imgSource:
        'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/friend7.jpeg',
  ),
];
