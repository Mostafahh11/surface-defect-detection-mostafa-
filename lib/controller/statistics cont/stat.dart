import 'package:defectscan/Api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  var isLoading = false.obs;
  var stats = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStats();
  }

  Future<void> fetchStats() async {
    try {
      isLoading.value = true;

      final res = await ApiService.getScanStatistics();

      if (res != null) {
        stats.value = res;
      }
    } catch (e) {
      debugPrint("Stats error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ================== GETTERS ==================
  int get passed => stats['passed_count'] ?? 0;
  int get defects => stats['defect_count'] ?? 0;
  int get totalDefects => stats['total_defects'] ?? 0;
  double get accuracy => (stats['accuracy'] ?? 0).toDouble();
}