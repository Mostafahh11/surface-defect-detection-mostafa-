import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences shared;

  static Future init() async {
    shared = await SharedPreferences.getInstance();
  }

  // حفظ الجلسة لأول مرة (عند اللوجين)
  static Future<void> saveUserSession({
    required String token,
    required Map<String, dynamic> user,
  }) async {
    await shared.setBool("isLogin", true);
    await shared.setString("token", token);
    await shared.setString("user", jsonEncode(user));
  }

  // تحديث بيانات المستخدم فقط (اللي جاية من Me)
  static Future<void> updateUser(Map<String, dynamic> user) async {
    await shared.setString("user", jsonEncode(user));
  }

  static String? getToken() {
    return shared.getString("token");
  }

  static Map<String, dynamic>? getUser() {
    String? userString = shared.getString("user");
    if (userString == null) return null;
    return jsonDecode(userString);
  }

  static bool isLogin() {
    return shared.getBool("isLogin") ?? false;
  }
  
  // Theme and Logout methods...


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

  static Future logout() async {
    await shared.clear();
  }
}