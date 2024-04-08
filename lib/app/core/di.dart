import 'package:denomination/app/data/sqflite_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences/app_preferences.dart';
import 'preferences/app_preferences_impl.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final sharePreferences = await SharedPreferences.getInstance();
  final sqlService = SQFLiteService();

  final appPreferences = AppPreferencesIMPL(sharePreferences);
  getIt.registerLazySingleton<AppPreferences>(() => appPreferences);

  getIt.registerLazySingleton<SQFLiteService>(() => sqlService);
}
