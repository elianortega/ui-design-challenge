import 'package:auto_route/auto_route_annotations.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/journal/journal_view.dart';
import '../ui/views/mealInformation/meal_information_view.dart';

// @CustomAutoRouter
@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  JournalView journalViewRoute;
  MealInformationView mealInformationView;
}
