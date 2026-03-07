import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:defectscan/core/service/sharedpreff.dart';

class ThemeController extends GetxController {

  late RxBool isDarkMode;

  @override
  void onInit() {
    super.onInit();

    ThemeMode savedTheme = StorageService.getThemeMode();

    isDarkMode = (savedTheme == ThemeMode.dark).obs;

    Get.changeThemeMode(savedTheme);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    ThemeMode newTheme =
        isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

    Get.changeThemeMode(newTheme);

    StorageService.saveThemeMode(newTheme);
  }
}