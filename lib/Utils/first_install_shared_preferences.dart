import 'package:shared_preferences/shared_preferences.dart';

class FirstInstallSharedPreferences {
  FirstInstallSharedPreferences._privateConstructor();

  static final FirstInstallSharedPreferences instance =
      FirstInstallSharedPreferences._privateConstructor();

  void setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? true;
  }
}
