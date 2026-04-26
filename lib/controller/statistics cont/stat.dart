import 'package:defectscan/Api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class StatisticsController extends GetxController {
  var isLoading = false.obs;
  var stats = {}.obs;

  RxList<Map<String, dynamic>> scans = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  // 2. دالة بتجيب الإحصائيات والفحوصات مع بعض
  Future<void> fetchAllData() async {
    isLoading.value = true;
    try {
      final resStats = await ApiService.getScanStatistics();
      if (resStats != null) {
        stats.value = resStats;
      }

      // جلب الفحوصات (Scans)
      final resScans = await ApiService.getScans();
      if (resScans.isNotEmpty) {
        scans.assignAll(resScans.cast<Map<String, dynamic>>());
      }
    } finally {
      isLoading.value = false;
    }
  }

  double get accuracy {
    var raw = stats['accuracy'] ?? 0.0;
    return double.tryParse(raw.toString()) ?? 0.0;
  }

  // 2. تحديث الميثود عشان تبقى متوافقة مع شكل الداتا الجديد
  double getScanAccuracy(Map<String, dynamic> scan) {
    final raw = scan['accuracy'] ?? 0.0;
    return double.tryParse(raw.toString()) ?? 0.0;
  }

  List<StatCardData> get dynamicStateCards {
    var actualData = stats['data'] ?? stats['statistics'] ?? stats;
    return [
      StatCardData(
        title: 'Passed',
        value: (actualData['passedCount'] ?? 0).toString(), // تعديل هنا
        trend: '+12%',
        icondata: Icons.check_circle_outline,
        color: const Color(0xFFB2EEDB),
      ),
      StatCardData(
        title: 'Defect',
        value: (actualData['defectCount'] ?? 0).toString(), // تعديل هنا
        trend: '-0.8%',
        icondata: Icons.warning_amber_rounded,
        color: const Color(0xFFFFDF9B),
      ),
      StatCardData(
        title: 'Accuracy',
        value: '${actualData['accuracy'] ?? 0}%', // تعديل هنا
        trend: '+2.3%',
        icondata: Icons.trending_up_rounded,
        color: const Color(0xFFFCBCA1),
      ),
      StatCardData(
        title: 'Total Defects',
        value: (actualData['totalDefects'] ?? 0).toString(), // تعديل هنا
        trend: '-0.5%',
        icondata: Icons.access_time_rounded,
        color: const Color(0xFFB5BAFF),
      ),
    ];
  }

  Future<void> exportStatistics() async {
    try {
      if (stats.isEmpty) {
        Get.snackbar("Error", "No data to export");
        return;
      }

      final data = stats;

      /// 🔥 تجهيز CSV
      final csv = StringBuffer();

      csv.writeln("Metric,Value");
      csv.writeln("Passed,${data['passedCount'] ?? 0}");
      csv.writeln("Defects,${data['defectCount'] ?? 0}");
      csv.writeln("Total Defects,${data['totalDefects'] ?? 0}");
      csv.writeln("Accuracy,${data['accuracy'] ?? 0}");
      csv.writeln("Success Rate,${data['successRate'] ?? 0}");

      /// 🔥 حفظ الملف
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/statistics.csv");

      await file.writeAsString(csv.toString());

      /// 🔥 مشاركة الملف
      await Share.shareXFiles([XFile(file.path)], text: "Statistics Export");
    } catch (e) {
      Get.snackbar("Error", "Export failed");
    }
  }
}

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
