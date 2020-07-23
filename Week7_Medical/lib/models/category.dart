import 'package:flutter/material.dart';

class Category {
  final String title;
  final IconData icon;

  const Category({
    @required this.title,
    @required this.icon,
  });
}

const categoryList = <Category>[
  Category(title: 'appointment', icon: Icons.view_agenda),
  Category(title: 'register', icon: Icons.access_alarms),
  Category(title: 'medicine', icon: Icons.hourglass_empty),
  Category(title: 'test', icon: Icons.accessible),
];
