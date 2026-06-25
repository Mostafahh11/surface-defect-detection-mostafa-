import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/core/service/sharedpreff.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    ThemeMode savedTheme = StorageService.getThemeMode();
    isDarkMode.value = (savedTheme == ThemeMode.dark);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    ThemeMode newMode = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  
    Get.changeThemeMode(newMode);
    
        StorageService.saveThemeMode(newMode);
  }
}