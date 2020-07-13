import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

import '../widgets/message_bubble.dart';

class MessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: _appBar(context),
      body: Container(
        decoration: mainContainerDecoration(color: AppColors.messageBackground),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Kler Burda',
                      style: kPreviewMessageTextStyle,
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'Was online 56 sec ago',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    MessageBubble(
                      myMessage: true,
                      messageText: 'Hello, how are you?',
                      messageType: MessageType.Text,
                    ),
                    MessageBubble(
                      messageText: 'Fine, hope to see you on the weekend!',
                      myMessage: false,
                      messageType: MessageType.Text,
                    ),
                    MessageBubble(
                      myMessage: true,
                      messageText: 'Hope we have no problems',
                      messageType: MessageType.Text,
                    ),
                    MessageBubble(
                      messageText: 'See you!',
                      myMessage: false,
                      messageType: MessageType.Text,
                    ),
                    MessageBubble(
                      messageText:
                          'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week4_UI_WhatsApp/assets/images/cat.jpeg',
                      myMessage: true,
                      messageType: MessageType.Image,
                    ),
                    MessageBubble(
                      myMessage: false,
                      messageType: MessageType.Audio,
                    ),
                  ],
                ),
              ),
            ),
            _bottomUserInput()
          ],
        ),
      ),
      // bottomNavigationBar: _bottomUserInput(),
    );
  }

  Container _bottomUserInput() {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 0.0,
      ),
      height: 80,
      color: AppColors.messageBackground,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.tag_faces,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.file_upload,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_frames,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green,
            ),
            child: IconButton(
              icon: Icon(
                Icons.record_voice_over,
                size: 18,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Container(
      child: IconButton(
        splashRadius: null,
        padding: EdgeInsets.only(left: 20.0),
        icon: Icon(
          Icons.flip_to_back,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
    actions: [
      IconButton(
        splashRadius: null,
        padding: EdgeInsets.only(right: 20.0),
        icon: Icon(Icons.blur_on),
        onPressed: () {},
      ),
    ],
  );
}
