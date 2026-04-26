import 'package:defectscan/controller/statistics cont/stat.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPieChart extends StatelessWidget {
  final StatisticsController controller;

  const ResultPieChart({super.key, required this.controller});

  double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    return double.tryParse(value.toString()) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.stats.isEmpty) {
        return const Center(
          child: Text("No data"),
        );
      }

      final stats = controller.stats;

      double passed = _toDouble(stats['passedCount']);
      double defects = _toDouble(stats['defectCount']);

      double total = passed + defects;

      /// تحويل لنسب %
      double passedPercent =
          total == 0 ? 0.0 : ((passed / total) * 100);

      double defectPercent =
          total == 0 ? 0.0 : ((defects / total) * 100);

      /// fallback لو مفيش داتا
      if (passedPercent == 0 && defectPercent == 0) {
        passedPercent = 100;
        defectPercent = 0;
      }

      return SizedBox(
        height: 180,
        child: PieChart(
          PieChartData(
            sectionsSpace: 4,
            centerSpaceRadius: 40,
            sections: [
              /// ✅ Passed
              PieChartSectionData(
                value: passedPercent,
                color: Colors.green,
                title: '${passedPercent.toStringAsFixed(0)}%',
                radius: 25,
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// ❌ Defects
              PieChartSectionData(
                value: defectPercent,
                color: Colors.redAccent,
                title: defectPercent > 0
                    ? '${defectPercent.toStringAsFixed(0)}%'
                    : '',
                radius: 28,
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}