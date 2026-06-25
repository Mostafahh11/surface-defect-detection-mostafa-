import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[50],

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
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: const Color(0xFF1E1E1E),
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

//*=====================================================================================//
class MysticMauvetheme {
  static final mysticMauveTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: MysticMauve.midNightViolet,

    cardColor: MysticMauve.vintageGrape,

    dividerColor: MysticMauve.mauveShadow.withOpacity(0.4),

    colorScheme: ColorScheme.dark(
      primary: MysticMauve.mauveShadow,
      secondary: MysticMauve.fadedCopper,
      surface: MysticMauve.vintageGrape,
      onSurface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: MysticMauve.midNightViolet,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: MysticMauve.dustyTaupe,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MysticMauve.vintageGrape,
      selectedItemColor: MysticMauve.fadedCopper,
      unselectedItemColor: MysticMauve.dustyTaupe.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
    ),

    iconTheme: IconThemeData(color: MysticMauve.fadedCopper),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MysticMauve.mauveShadow,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MysticMauve.vintageGrape.withOpacity(0.6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: MysticMauve.mauveShadow),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: MysticMauve.fadedCopper, width: 2),
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: MysticMauve.dustyTaupe,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(color: MysticMauve.dustyTaupe),
      bodySmall: TextStyle(color: MysticMauve.fadedCopper.withOpacity(0.8)),
    ),
  );
}
//?=====================================================================================//

class DeepSeaTheme {
  static final deepSeaTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: DeepSea.org,

    cardColor: DeepSea.fourth,

    dividerColor: DeepSea.third.withOpacity(0.4),

    colorScheme: ColorScheme.dark(
      primary: DeepSea.third,
      secondary: DeepSea.sec,
      surface: DeepSea.fourth,
      onSurface: DeepSea.first,
      onPrimary: DeepSea.first,
      onSecondary: DeepSea.first,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: DeepSea.fifth,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: DeepSea.first),
      titleTextStyle: TextStyle(
        color: DeepSea.first,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DeepSea.fourth,
      selectedItemColor: DeepSea.first,
      unselectedItemColor: DeepSea.sec,
      type: BottomNavigationBarType.fixed,
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: DeepSea.fifth,
    ),

    iconTheme: IconThemeData(
      color: DeepSea.sec,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DeepSea.third,
        foregroundColor: DeepSea.first,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DeepSea.fourth,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: DeepSea.third,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: DeepSea.sec,
          width: 2,
        ),
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: DeepSea.first,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: DeepSea.first,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: DeepSea.first,
      ),
      bodyMedium: TextStyle(
        color: DeepSea.sec,
      ),
      bodySmall: TextStyle(
        color: DeepSea.sec.withOpacity(0.8),
      ),
    ),
  );
}