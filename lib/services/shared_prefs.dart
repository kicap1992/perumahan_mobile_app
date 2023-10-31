import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefs {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await this.prefs;
    return prefs.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await this.prefs;
    return prefs.setString(key, value);
  }

  Future<bool> removeString(String key) async {
    final SharedPreferences prefs = await this.prefs;
    return prefs.remove(key);
  }

  Future<bool> clear() async {
    final SharedPreferences prefs = await this.prefs;
    return prefs.clear();
  }
}
