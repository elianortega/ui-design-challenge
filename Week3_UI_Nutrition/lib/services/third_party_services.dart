import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServices {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  DialogService get dialogService;
}
