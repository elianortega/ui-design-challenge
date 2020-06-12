import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_circle_avatar.dart';
import '../shared/app_colors.dart';
import '../shared/constants.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String time;
  final bool myMessage;
  final MessageType messageType;
  const MessageBubble({
    Key key,
    this.messageText,
    this.time,
    this.myMessage,
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          myMessage ? _messageTime() : _circleAvatar(),
          SizedBox(width: 10.0),
          _messageBubble(),
          SizedBox(width: 10.0),
          myMessage ? _circleAvatar() : _messageTime(),
        ],
      ),
    );
  }

  Widget _messageTime() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/double-checking.png',
          height: 16,
          color: AppColors.green,
        ),
        Text(
          '12:54',
          style: TextStyle(color: AppColors.green),
        ),
      ],
    );
  }

  Expanded _messageBubble() {
    return Expanded(
        child: Container(
      padding: messageType == MessageType.Image
          ? EdgeInsets.zero
          : EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: myMessage ? Colors.white : AppColors.green,
        borderRadius: myMessage
            ? BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(0.0),
                topLeft: Radius.circular(20),
              ),
        image: messageType == MessageType.Image
            ? DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  messageText,
                ),
              )
            : null,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            spreadRadius: -15.0,
          )
        ],
      ),
      child: _buildChild(),
    ));
  }

  Widget _buildChild() {
    if (messageType == MessageType.Text) {
      return Text(
        messageText,
        style: TextStyle(
          fontSize: 14.0,
          color: myMessage ? AppColors.green : Colors.white,
        ),
      );
    } else if (messageType == MessageType.Image) {
      return Container(
        height: 200,
      );
    } else {
      return Container(
        height: 30,
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.playCircle,
              color: Colors.white,
            ),
            SizedBox(width: 5.0),
            Expanded(
              child: Image.asset(
                'assets/images/audio.png',
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(.8),
              ),
            ),
          ],
        ),
      );
    }
  }

  CustomCircleAvatar _circleAvatar() {
    return CustomCircleAvatar(
      radius: 25,
      imgSource:
          myMessage ? 'assets/images/elian.jpg' : 'assets/images/friend4.jpeg',
    );
  }
}
