import 'package:Week6_UI_Bank/constants.dart';
import 'package:Week6_UI_Bank/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CardDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
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
    return Container(
      color: AppColors.pink,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _WhiteContainer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CreditCard(
                  width: double.infinity,
                  height: 230,
                  margin: EdgeInsets.zero,
                ),
                SizedBox(height: 30.0),
                _TotalSpendings(),
                SizedBox(height: 30.0),
                _Transactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Transactions extends StatelessWidget {
  const _Transactions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Transactions',
              style: kSmallTextStyle,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  _Transaction(
                    title: 'Uber Ride',
                    icon: FontAwesomeIcons.uber,
                    price: 10,
                  ),
                  _Transaction(
                    title: 'Dribbble Pro Account',
                    icon: FontAwesomeIcons.dribbble,
                    price: 10,
                  ),
                  _Transaction(
                    title: 'Grocery Shopping',
                    icon: FontAwesomeIcons.store,
                    price: 10,
                  ),
                  _Transaction(
                    title: 'Book Store',
                    icon: FontAwesomeIcons.bookOpen,
                    price: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Transaction extends StatelessWidget {
  final String title;
  final IconData icon;
  final double price;
  const _Transaction({
    Key key,
    this.title,
    this.icon,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FaIcon(
                icon,
                color: AppColors.purple,
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kSmallTextStyle.copyWith(
                    fontSize: 18,
                    color: AppColors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  DateFormat.yMd().add_jm().format(DateTime.now()),
                  style: kSmallTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: kSmallTextStyle.copyWith(
                color: AppColors.pink,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ));
  }
}

class _TotalSpendings extends StatelessWidget {
  const _TotalSpendings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Spendings',
            style: kSmallTextStyle,
          ),
          Text(
            '\$995.45',
            style: kMediumTextStyle.copyWith(color: AppColors.purple),
          ),
          Text(
            'Total Spendings',
            style: kSmallTextStyle,
          ),
        ],
      ),
    );
  }
}

class _WhiteContainer extends StatelessWidget {
  const _WhiteContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }
}
