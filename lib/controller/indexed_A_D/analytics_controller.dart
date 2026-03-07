import 'package:defectscan/Home/anlytics_grids/anylitces_page.dart';
import 'package:defectscan/Home/reports/reports_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  RxInt selectedpage = 0.obs;
  List<Widget> pages = [AnalyticsGrid(), DetailedReportPage()];
  void nextPage() {
    if (selectedpage.value < pages.length - 1) {
      selectedpage.value++;
    } else {
     
    }
  }

  void previousPage() {
    if (selectedpage.value > 0) {
      selectedpage.value--;
    } else {
   
    }
  }
}
