import 'package:defectscan/controller/statistics cont/stat.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageGauge extends StatelessWidget {
  const StorageGauge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatisticsController>();

    return SizedBox(
      height: 180,
      child: Obx(() {
        if (controller.statistics.value== null) {
          return const Center(child: Text("No data"));
        }
        double accuracy = controller.accuracy;
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
                
                  PieChartSectionData(
                    value: accuracy,
                    radius: 15,
                    showTitle: false,
                    color: Colors.orange,
                  ),

                  PieChartSectionData(
                    value: remaining,
                    radius: 12,
                    showTitle: false,
                    color: Colors.grey.withOpacity(0.2),
                  ),

                  PieChartSectionData(
                    value: 100,
                    radius: 0,
                    showTitle: false,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),

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
