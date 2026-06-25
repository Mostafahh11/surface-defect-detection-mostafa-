import 'dart:io';

import 'package:defectscan/Model/scansmodel/statistices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class StatisticsController extends GetxController {
  var isLoading = false.obs;
  var statistics = Rxn<Statistics>();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  int get totalDefect => statistics.value?.totalDefects ?? 0;
  int get passedCount => statistics.value?.passedCount ?? 0;
  int get defectCount => statistics.value?.defectCount ?? 0;
  double get accuracy => statistics.value?.accuracy ?? 0.0;



 
  

  

  List<StatCardData> get dynamicStateCards {
    return [
      StatCardData(
        title: 'Passed',
        value: passedCount.toString(),
        trend: '+12%',
        icondata: Icons.check_circle_outline,
        color: const Color(0xFFB2EEDB),
      ),
      StatCardData(
        title: 'Defect',
        value: defectCount.toString(),
        trend: '-0.8%',
        icondata: Icons.warning_amber_rounded,
        color: const Color(0xFFFFDF9B),
      ),
      StatCardData(
        title: 'Accuracy',
        value: '${accuracy.toStringAsFixed(1)}%',
        trend: '+2.3%',
        icondata: Icons.trending_up_rounded,
        color: const Color(0xFFFCBCA1),
      ),
      StatCardData(
        title: 'Total Defects',
        value: totalDefect.toString(),
        trend: '-0.5%',
        icondata: Icons.access_time_rounded,
        color: const Color(0xFFB5BAFF),
      ),
    ];
  }

  Future<void> exportStatistics() async {
    try {
      if (statistics.value == null) {
        Get.snackbar("Error", "No data to export");
        return;
      }
      final csv = StringBuffer();

      csv.writeln("Metric,Value");
      csv.writeln("Passed,$passedCount");
      csv.writeln("Defects,$defectCount");
      csv.writeln("Total Defects,$totalDefect");
      csv.writeln("Accuracy,$accuracy");

      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/statistics.csv");

      await file.writeAsString(csv.toString());
      await Share.shareXFiles([XFile(file.path)], text: "Statistics Export");
    } catch (e) {
      Get.snackbar("Error", "Export failed");
    }
  }
}

// موديل الكارت
class StatCardData {
  final String title;
  final String value;
  final String trend;
  final IconData icondata;
  final Color color;

  StatCardData({
    required this.title,
    required this.value,
    required this.trend,
    required this.icondata,
    required this.color,
  });
}
