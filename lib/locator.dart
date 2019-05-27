import 'package:get_it/get_it.dart';

import 'package:sevn/core/viewmodels/home_model.dart';
import 'core/services/api.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => HomeModel());
}
