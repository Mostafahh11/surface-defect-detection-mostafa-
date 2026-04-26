import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/controller/statistics cont/stat.dart';

class StatisticsChart extends StatelessWidget {
  final StatisticsController controller;

  const StatisticsChart({super.key, required this.controller});

  /// 🔥 تحويل آمن لأي نوع لـ double
  double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    return double.tryParse(value.toString()) ?? 0.0;
  }

  /// 🔥 حساب النسبة بشكل آمن
  double _percent(double part, double total) {
    if (total == 0) return 0.0;
    return (part / total) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.stats.isEmpty) {
        return const Center(
          child: Text(
            "No statistics available",
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      final stats = controller.stats;

      final accuracy = _toDouble(stats['accuracy']);
      final success = _toDouble(stats['successRate']);
      final passed = _toDouble(stats['passedCount']);
      final defects = _toDouble(stats['defectCount']);

      final total = passed + defects;

      final passedPercent = _percent(passed, total);
      final defectPercent = _percent(defects, total);

      return SizedBox(
        height: 250,
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: 105,
            minX: 0,
            maxX: 3,

            /// Grid
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 25,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.withOpacity(0.1),
                  strokeWidth: 1,
                );
              },
            ),

            borderData: FlBorderData(show: false),

            /// 🔥 Tooltip
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => Colors.black.withOpacity(0.8),
                getTooltipItems: (spots) {
                  const labels = ["Accuracy", "Success", "Passed", "Defects"];

                  return spots.map((spot) {
                    return LineTooltipItem(
                      "${labels[spot.x.toInt()]}\n${spot.y.toStringAsFixed(1)}%",
                      const TextStyle(color: Colors.white),
                    );
                  }).toList();
                },
              ),
            ),

            /// Axis
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const labels = ["Acc", "Suc", "Pass", "Def"];

                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        labels[value.toInt()],
                        style: TextStyle(color: Colors.grey[600], fontSize: 10),
                      ),
                    );
                  },
                ),
              ),

              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 25,
                  reservedSize: 35,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      "${value.toInt()}%",
                      style: TextStyle(color: Colors.grey[600], fontSize: 10),
                    );
                  },
                ),
              ),

              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),

            /// 🔥 Line
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, accuracy), // Accuracy
                  FlSpot(1, success), // Success Rate
                  FlSpot(2, passedPercent), // Passed %
                  FlSpot(3, defectPercent), // Defects %
                ],
                isCurved: true,
                curveSmoothness: 0.35,
                color: Colors.blueAccent,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blueAccent.withOpacity(0.15),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
