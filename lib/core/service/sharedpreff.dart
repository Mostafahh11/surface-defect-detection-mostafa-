import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences shared;

  static Future init() async {
    shared = await SharedPreferences.getInstance();
  }

  // =========================
  //  LOGIN
  // =========================

  static Future saveUserLogin({
    required int userid,
    required String firstname,
    required String secoundname,
    required String useremail,
    required String userpassword,
  }) async {
    await shared.setBool("isLogin", true);
    await shared.setString("firstname", firstname);
    await shared.setString("secoundname", secoundname);
    await shared.setInt("id", userid);
    await shared.setString("email", useremail);
    await shared.setString("password", userpassword);
  }

  static bool isLogin() {
    return shared.getBool("isLogin") ?? false;
  }

  // =========================
  //  THEME
  // =========================

  static Future saveThemeMode(ThemeMode mode) async {
    await shared.setString("themeMode", mode.name);
  }

  static ThemeMode getThemeMode() {
    String? mode = shared.getString("themeMode");

    if (mode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else if (mode == ThemeMode.light.name) {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  static bool isDarkMode() {
    return getThemeMode() == ThemeMode.dark;
  }

  // =========================
  // 🚪 LOGOUT
  // =========================

  static Future clear() async {
    await shared.clear();
  }
}