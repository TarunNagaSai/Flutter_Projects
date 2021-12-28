import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Models/login_data.dart';

class LoginServices {
  static const String loginPreferencesKey = 'Logindata';
  // Adding login data to shared preferances
  static void addLoginDetails(LoginData credential) async {
    List<String> loginCredentials = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    loginCredentials = [loginDataToJson(credential)];
    preferences.setStringList(loginPreferencesKey, loginCredentials);
  }

  static Future<bool> checkLoginDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(loginPreferencesKey)) {
      return true;
    } else {
      return false;
    }
  }

  static void clearCredentials() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(loginPreferencesKey)) {
      preferences.remove(loginPreferencesKey);
    }
  }
}
