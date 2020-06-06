import 'package:Week3_UI_Nutrition/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MealInformationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigationPop() {
    _navigationService.popRepeated(1);
  }
}
