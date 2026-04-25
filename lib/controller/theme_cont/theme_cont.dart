import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/core/service/sharedpreff.dart';

class ThemeController extends GetxController {
  // متغير مراقب لحالة الثيم
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 1. أول ما يفتح، يقرأ الحالة من الـ Shared Preferences
    ThemeMode savedTheme = StorageService.getThemeMode();
    isDarkMode.value = (savedTheme == ThemeMode.dark);
  }

  // ميثود التبديل البسيطة
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    
    ThemeMode newMode = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
    
    // تغيير الثيم لحظياً
    Get.changeThemeMode(newMode);
    
    // حفظ في الكاش للمرة الجاية
    StorageService.saveThemeMode(newMode);
  }
}