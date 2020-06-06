import 'package:UI_FoodDelivery/screens/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: GetStartedScreen.id,
      routes: {
        GetStartedScreen.id: (ctx) => GetStartedScreen(),
        HomeScreen.id: (ctx) => HomeScreen(),
        DetailScreen.id: (ctx) => DetailScreen(),
      },
    );
  }
}
