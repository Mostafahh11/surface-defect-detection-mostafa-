import 'package:defectscan/Home/anlytics_grids/anylitces_page.dart';
import 'package:defectscan/Home/dashboard/dashboard.dart';
import 'package:defectscan/Home/history/history_page.dart';
import 'package:defectscan/Home/settings/setting_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationbarController extends GetxController {
  final RxInt selectedindex = 0.obs;
  List<String> titles = ["Home", "Analytics", "History", "Setting"];
  final List<Widget> pages = [
    Dashboard(),
    const AnalyticsGrid(),
    const HistoryPage(),
    SettingsPage(),
  ];
   final List<IconData> navIcons = [
    Icons.dashboard_customize_rounded, // Home
    Icons.analytics_outlined, // Analysis
    Icons.manage_search_rounded, // History
    Icons.person_outline_rounded, // Profile
  ];
}
