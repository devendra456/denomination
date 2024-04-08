import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';

class AppPreferencesIMPL implements AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferencesIMPL(this._sharedPreferences);

  @override
  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return await _sharedPreferences.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> clearAllPreferences() async {
    return await _sharedPreferences.clear();
  }

  @override
  List<String> getListString(String key) {
    return _sharedPreferences.getStringList(key)??[];
  }

  @override
  Future<bool> setStringList(String key,  List<String> value) async {
    return await _sharedPreferences.setStringList(key, value);
  }
}
