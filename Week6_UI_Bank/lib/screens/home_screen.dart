import 'package:Week6_UI_Bank/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: _Body(),
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
        Expanded(
          child: _AccountDescription(),
        ),
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
                  child: _BalanceContainer(
                    description: 'Spendings',
                    title: '\$995.45',
                    selected: true,
                  ),
                ),
                Expanded(
                  child: _BalanceContainer(
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

class _BalanceContainer extends StatelessWidget {
  final String title;
  final String description;
  final bool selected;

  const _BalanceContainer({
    Key key,
    this.title,
    this.description,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: selected ? AppColors.purple : AppColors.lightPink,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Text(
            description,
            style: kSmallTextStyle.copyWith(
              color: selected ? Colors.white : Colors.white.withOpacity(.6),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            title,
            style: kMediumTextStyle.copyWith(
              color: selected ? Colors.white : Colors.white.withOpacity(.6),
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
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [_TimeButtons()],
      ),
    );
  }
}

class _TimeButtons extends StatelessWidget {
  const _TimeButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _TimeButton(
          title: 'Day',
        ),
        _TimeButton(
          title: 'Week',
          selected: true,
        ),
        _TimeButton(
          title: 'Month',
        ),
        _TimeButton(
          title: 'Year',
        ),
      ],
    );
  }
}

class _TimeButton extends StatelessWidget {
  final String title;
  final bool selected;
  const _TimeButton({
    Key key,
    this.title,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: selected ? AppColors.purple : Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        title,
        style: kSmallTextStyle.copyWith(
          color: selected ? Colors.white : AppColors.lightPurple,
        ),
      ),
    );
  }
}
