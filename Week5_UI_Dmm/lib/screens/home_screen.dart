import 'package:Week5_UI_Dmm/screens/fun_facts_screen.dart';
import 'package:Week5_UI_Dmm/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  final Function toggle;
  const HomeScreen({Key key, this.toggle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, .9],
          colors: [
            Colors.white,
            Colors.grey[300],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _AppBar(),
                SizedBox(height: 40.0),
                _TextField(),
                SizedBox(height: 10.0),
                _Cards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _MyCard(),
          _MyCard(),
        ],
      ),
    );
  }
}

class _MyCard extends StatelessWidget {
  const _MyCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FunFactScreen(),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 50.0),
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 50),
              blurRadius: 20.0,
              spreadRadius: -15.0,
              color: Colors.grey.withOpacity(.5),
            )
          ],
        ),
        // height: MediaQuery.of(context).size.height * .7,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '80% is solved',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircularPercentIndicator(
                  radius: 47.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: 0.7,
                  center: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: new Text(
                        "80",
                        style: new TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.loading,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              child: Row(
                children: [
                  Container(
                    width: 120,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        FittedBox(
                          child: Text(
                            'Jeff.',
                            style: TextStyle(
                              fontSize: 100.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        FittedBox(
                          child: Text(
                            'Illustration',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: 70,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.orangeLight.withOpacity(.6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            '\$19',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(
                        'assets/svg/space.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: SvgPicture.asset('assets/svg/male_avatar.svg'),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Juan Poole',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Glen James',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.grey,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          icon: Icon(Icons.search),
          border: InputBorder.none,
        ),
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
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Refund Requests',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '26 refund requests',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              height: 70,
              width: 70,
            ),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.assignment_ind,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void function(value) {
    value = 7;
  }
}
