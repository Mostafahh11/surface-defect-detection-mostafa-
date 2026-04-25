import 'package:defectscan/Routes/pages_routes.dart';
import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:defectscan/features/themes/Themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.greyDarkTheme,
      themeMode: StorageService.getThemeMode(),
      // home: OtpPage(),
      initialRoute: "/onboardingpage",
      getPages: routes,
    );
  }
}
