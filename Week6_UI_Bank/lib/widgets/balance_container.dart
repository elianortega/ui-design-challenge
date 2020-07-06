import 'package:flutter/material.dart';

import '../constants.dart';

class BalanceContainer extends StatelessWidget {
  final String title;
  final String description;
  final bool selected;

  const BalanceContainer({
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
