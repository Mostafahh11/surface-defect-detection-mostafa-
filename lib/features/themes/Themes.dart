import 'package:flutter/material.dart';

class AppThemes {
  // --- 1. LIGHT THEME (أبيض نقي مع أسود) ---
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor:  Colors.grey[50],

    cardColor: Colors.white,
    dividerColor: Colors.grey.withOpacity(0.2),

    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.blueAccent,
      surface: Colors.white,
      onSurface: Colors.black,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    ),

    iconTheme: const IconThemeData(color: Colors.black87),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(color: Colors.black87),
      bodySmall: TextStyle(color: Colors.grey),
    ),
  );

  //?======================usedddd================================//
  // --- 3. GREY DARK (الرمادي الفحمى Modern) ---
  static final greyDarkTheme = ThemeData(
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: const Color(0xFF121212), // أسود مطفي
    cardColor: const Color(0xFF1E1E1E), // رمادي غامق للكروت
    dividerColor: Colors.white12,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1E1E1E),
      secondary: Colors.blueGrey,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
      bodySmall: TextStyle(color: Colors.grey),
    ),
  );
}
