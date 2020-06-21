import 'package:Week5_UI_Dmm/animation/slide_animation.dart';
import 'package:Week5_UI_Dmm/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FunFactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            right: 20.0,
            left: 20.0,
          ),
          child: Column(
            children: [
              _AppBar(),
              SizedBox(height: 30.0),
              _Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          SlideAnimation(
            delay: 700,
            offset: Offset(0, 100),
            child: _FunFactCard(
              backgroundColor: AppColors.pink,
              textColor: AppColors.darkPink,
              introText: 'Most popular on',
              title: 'Shutter',
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(3, 3),
                    child: Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-3, -3),
                    child: Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SlideAnimation(
            delay: 900,
            offset: Offset(0, 100),
            child: _FunFactCard(
              backgroundColor: AppColors.lightBlue,
              textColor: AppColors.darkLightBlue,
              introText: 'You have earned',
              title: '1,509.89',
              icon: Icon(
                Icons.account_balance_wallet,
                color: AppColors.darkLightBlue,
              ),
              imgSource: 'assets/svg/wallet.svg',
            ),
          ),
          _FunFactCard(
            backgroundColor: AppColors.purple,
            textColor: AppColors.darkPurple,
            introText: 'Best Selling',
            title: 'Ilustrations',
            icon: FaIcon(
              FontAwesomeIcons.paintBrush,
              color: AppColors.darkPurple,
            ),
          ),
          _FunFactCard(
            backgroundColor: AppColors.yellow,
            textColor: AppColors.darkYellow,
            introText: 'Get to know',
            title: 'Art',
            icon: FaIcon(
              FontAwesomeIcons.paintRoller,
              color: AppColors.darkYellow,
            ),
            imgSource: 'assets/svg/paint.svg',
          ),
        ],
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideAnimation(
          delay: 600,
          offset: Offset(-200, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fun facts',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'The author\'s life.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        SlideAnimation(
          delay: 600,
          offset: Offset(200, 0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        // SizedBox(height: 40.0),
      ],
    );
  }
}

class _FunFactCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String introText;
  final String title;
  final Widget icon;
  final String imgSource;
  const _FunFactCard({
    Key key,
    this.backgroundColor,
    this.textColor,
    this.introText,
    this.title,
    this.icon,
    this.imgSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    spreadRadius: -15,
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.5),
                  )
                ],
              ),
              child: Center(child: icon),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            introText,
            style: TextStyle(
              color: textColor,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          imgSource == null
              ? Container()
              : SvgPicture.asset(
                  imgSource,
                  height: 300,
                )
        ],
      ),
    );
  }
}
