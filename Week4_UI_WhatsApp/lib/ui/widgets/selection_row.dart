import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class SelectionRow extends StatelessWidget {
  const SelectionRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _textBox(title: 'Messages', isSelected: true),
          _textBox(title: 'Online'),
          _textBox(title: 'Groups'),
        ],
      ),
    );
  }

  Widget _textBox({@required String title, bool isSelected = false}) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          right: 35.0,
          left: 20.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 28.0,
            color: isSelected ? Colors.white : AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
