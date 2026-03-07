import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey,
    ),
    
  );

  // static final darkTheme = ThemeData(
  //   primaryColor: Colors.white,
  //   scaffoldBackgroundColor: Colors.green,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.black,
  //     foregroundColor: Colors.white,
  //     titleTextStyle: TextStyle(color: Colors.white),
  //     elevation: 0,
  //   ),
  //   colorScheme: ColorScheme.dark(
  //     primary: Colors.white,
  //     secondary: Colors.grey,
  //   ),
  // )

}

class orginaltheme {
  static const Color mainDark = Color(0xff0B132B);

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: mainDark,

    /// نظام الألوان
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff0B132B),
      surface: Color(0xff1C2541), 
      onPrimary: Colors.white,
      onSurface: Colors.white,
    ),

    /// AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff0B132B),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    /// النصوص
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      bodySmall: TextStyle(color: Colors.grey),
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    
    cardColor: const Color(0xff1C2541),

     
    dividerColor: Colors.grey,
  );
}

class greydarktheme {
  static const Color background = Color(0xFF212121);
  static const Color surface = Color(0xFF2B2B2B);

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      surface: surface,
      background: background,
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2B2B2B),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    cardColor: surface,
    iconTheme: IconThemeData(color: Colors.white),

    // textTheme: TextTheme(
    //   bodyLarge: TextStyle(color: Colors.white),
    //   bodyMedium: TextStyle(color: Colors.grey[400]), // رمادي ناعم
    //   bodySmall: TextStyle(color: Colors.grey[400]),
    // ),

    dividerColor: const Color(0xFF3A3A3A),
  );
}
