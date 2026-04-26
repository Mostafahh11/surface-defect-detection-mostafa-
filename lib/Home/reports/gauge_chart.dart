import 'package:defectscan/controller/statistics cont/stat.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageGauge extends StatelessWidget {
  const StorageGauge({super.key});

  double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    return double.tryParse(value.toString()) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatisticsController>();

    return SizedBox(
      height: 180,
      child: Obx(() {
        if (controller.stats.isEmpty) {
          return const Center(child: Text("No data"));
        }

        final stats = controller.stats;

        double accuracy = _toDouble(stats['accuracy']);

        /// حماية
        if (accuracy < 0) accuracy = 0;
        if (accuracy > 100) accuracy = 100;

        double remaining = 100 - accuracy;

        return Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                startDegreeOffset: 180,
                sectionsSpace: 0,
                centerSpaceRadius: 50,
                sections: [
                  /// ✅ Accuracy
                  PieChartSectionData(
                    value: accuracy,
                    radius: 15,
                    showTitle: false,
                    color: Colors.orange,
                  ),

                  /// الجزء الفاضي
                  PieChartSectionData(
                    value: remaining,
                    radius: 12,
                    showTitle: false,
                    color: Colors.grey.withOpacity(0.2),
                  ),

                  /// إخفاء النص التاني من الدايرة
                  PieChartSectionData(
                    value: 100,
                    radius: 0,
                    showTitle: false,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),

            /// 🔥 النص في النص
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${accuracy.toStringAsFixed(1)}%",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Accuracy", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        );
      }),
    );
  }
}
