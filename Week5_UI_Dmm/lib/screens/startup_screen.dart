import 'package:Week5_UI_Dmm/animation/slide_animation.dart';
import 'package:Week5_UI_Dmm/shared/app_colors.dart';
import 'package:Week5_UI_Dmm/shared/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

class StartUpScreen extends StatelessWidget {
  final Function toggle;

  const StartUpScreen({Key key, this.toggle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AppBar(),
              _Carousel(),
              _Button(toggle: toggle),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.toggle,
  }) : super(key: key);

  final Function toggle;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      delay: 1000,
      offset: Offset(0, 200),
      curve: Curves.bounceOut,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: FlatButton(
            onPressed: () {
              toggle();
            },
            child: Text(
              'Find full details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      delay: 600,
      offset: Offset(0, 200),
      child: Container(
        height: MediaQuery.of(context).size.height * .60,
        // color: Colors.red,
        child: ImageCarousel(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      delay: 700,
      offset: Offset(-200, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Dmm ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '_',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
