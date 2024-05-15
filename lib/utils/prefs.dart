import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Future<String> getValues(key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  Future<void> setValues(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }
}
