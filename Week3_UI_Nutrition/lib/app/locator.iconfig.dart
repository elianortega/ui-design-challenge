// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:Week3_UI_Nutrition/services/third_party_services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServices = _$ThirdPartyServices();
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServices.dialogService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServices.navigationService);
}

class _$ThirdPartyServices extends ThirdPartyServices {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
