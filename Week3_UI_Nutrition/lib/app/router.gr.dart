// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:Week3_UI_Nutrition/ui/views/home/home_view.dart';
import 'package:Week3_UI_Nutrition/ui/views/journal/journal_view.dart';
import 'package:Week3_UI_Nutrition/ui/views/mealInformation/meal_information_view.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const journalViewRoute = '/journal-view-route';
  static const mealInformationView = '/meal-information-view';
  static const all = {
    homeViewRoute,
    journalViewRoute,
    mealInformationView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.journalViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => JournalView(),
          settings: settings,
        );
      case Routes.mealInformationView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MealInformationView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
