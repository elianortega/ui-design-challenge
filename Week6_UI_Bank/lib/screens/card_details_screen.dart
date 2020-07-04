import 'package:Week6_UI_Bank/constants.dart';
import 'package:Week6_UI_Bank/widgets/credit_card.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        color: AppColors.pink,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CreditCard(
                    width: double.infinity,
                    height: 230,
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
