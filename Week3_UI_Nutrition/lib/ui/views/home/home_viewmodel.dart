import 'package:Week3_UI_Nutrition/app/router.gr.dart';
import 'package:Week3_UI_Nutrition/constants.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';

import '../../../models/meal.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToJournal() async {
    await _navigationService.navigateTo(Routes.journalViewRoute);
  }

  Future navigateToMealInformation() async {
    await _navigationService.navigateTo(Routes.mealInformationView);
  }

  //  void navigateToJournal(BuildContext context)  {

  // }

  List<Meal> _mealList = globalMealList;

  List<Meal> get mealList => _mealList;
}
