import 'package:Week6_UI_Bank/animation/slide_animation.dart';
import 'package:Week6_UI_Bank/widgets/balance_container.dart';
import 'package:flutter/material.dart';

import 'card_details_screen.dart';

import '../constants.dart';
import '../widgets/credit_card.dart';
import '../widgets/outline_card.dart';
import '../widgets/time_buttons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: CustomPaint(painter: _HomeScreenPainter(), child: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AccountInfo(),
        _AccountDescription(),
      ],
    );
  }
}

class _AccountInfo extends StatelessWidget {
  const _AccountInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: MediaQuery.of(context).size.height * .35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Total Balance',
                  style: kSmallTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '\$995.58',
                  style: kBigTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightPink,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: BalanceContainer(
                    description: 'Spendings',
                    title: '\$995.45',
                    selected: true,
                  ),
                ),
                Expanded(
                  child: BalanceContainer(
                    description: 'Income',
                    title: '\$1995.45',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideAnimation(
        duration: 500,
        offsetStart: Offset(0, 200),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TimeButtons(),
                _SpendingsGraph(),
                _CardList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SpendingsGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      offsetStart: Offset(0, 200),
      duration: 700,
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        height: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _DaySpendingsBar(
                    title: 'M',
                    averageExpense: .7,
                    expense: .5,
                  ),
                  _DaySpendingsBar(
                    title: 'T',
                    averageExpense: .9,
                    expense: .8,
                  ),
                  _DaySpendingsBar(
                    title: 'W',
                    averageExpense: .6,
                    expense: .9,
                  ),
                  _DaySpendingsBar(
                    title: 'T',
                    averageExpense: .4,
                    expense: .4,
                  ),
                  _DaySpendingsBar(
                    title: 'F',
                    averageExpense: .5,
                    expense: .3,
                  ),
                  _DaySpendingsBar(
                    title: 'S',
                    averageExpense: .8,
                    expense: .7,
                  ),
                  _DaySpendingsBar(
                    title: 'S',
                    averageExpense: .4,
                    expense: .2,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _GraphLabel(
                  title: 'Average',
                  color: Colors.grey[200],
                ),
                _GraphLabel(
                  title: 'This Week',
                  color: AppColors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _GraphLabel extends StatelessWidget {
  final String title;
  final Color color;
  const _GraphLabel({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: kSmallTextStyle,
        ),
      ],
    );
  }
}

class _DaySpendingsBar extends StatelessWidget {
  final String title;
  final double averageExpense;
  final double expense;
  const _DaySpendingsBar({
    Key key,
    this.title,
    this.averageExpense,
    this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Container(
                  height: (constraints.constrainHeight() - 27 - 5) * averageExpense,
                  width: 8.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                child: Container(
                  height: (constraints.constrainHeight() - 27 - 5) * expense,
                  width: 8.0,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: kSmallTextStyle,
          ),
        ],
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      offsetStart: Offset(0, 200),
      duration: 800,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        height: 140,
        // color: Colors.red,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CreditCard(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CardDetailsScreen(),
                  ),
                );
              },
            ),
            OutlineCard(),
          ],
        ),
      ),
    );
  }
}

class _HomeScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.purple
      ..style = PaintingStyle.fill;

    Path topPurple = Path()
      ..moveTo(0, 110)
      ..quadraticBezierTo(70, 90, 130, 0)
      ..lineTo(250, 0)
      ..quadraticBezierTo(197, 60, 130, 70)
      ..quadraticBezierTo(63, 90, 0, 200);

    canvas.drawPath(topPurple, paint);
  }

  @override
  bool shouldRepaint(_HomeScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_HomeScreenPainter oldDelegate) => false;
}
