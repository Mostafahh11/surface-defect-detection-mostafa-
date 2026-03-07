import 'package:defectscan/Home/anlytics_grids/anylitces_page.dart';
import 'package:defectscan/Home/dashboard/dashboard.dart';
import 'package:defectscan/Home/history/history_page.dart';
import 'package:defectscan/Home/settings/setting_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationbarController extends GetxController {
  final RxInt selectedindex = 0.obs;
  
  final List<Widget> pages = [
     Dashboard(),
    const AnalyticsGrid(),
    const HistoryPage(),
    SettingsPage(),
  ];
}
