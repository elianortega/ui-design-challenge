import 'package:flutter/material.dart';

import '../constants.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 150,
      width: 230,
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 20,
              child: Image.network(
                'https://raw.githubusercontent.com/elian-ortega/ui-design-challenge/master/Week6_UI_Bank/assets/images/visa.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                '1234  5678  9890  1244',
                style: kSmallTextStyle.copyWith(
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
