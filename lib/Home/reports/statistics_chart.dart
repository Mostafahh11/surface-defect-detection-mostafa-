import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsChart extends StatelessWidget {
  final ProfileCont profcontroller;

  const StatisticsChart({super.key, required this.profcontroller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profcontroller.scans.length < 2) {
        return const Center(
          child: Text(
            "Perform more scans to view analytics",
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      return SizedBox(
        height: 220,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),

            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) =>
                    Colors.blueGrey.withOpacity(0.8),
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((barSpot) {
                    return LineTooltipItem(
                      '${barSpot.y.toStringAsFixed(1)}%',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
            ),

            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    // عرض رقم الفحص (S1, S2, ...)
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "S${value.toInt() + 1}",
                        style: TextStyle(color: Colors.grey[600], fontSize: 10),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 25, // تقسيم المحور لـ 0, 25, 50, 75, 100
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

            lineBarsData: [
              // المنحنى الأساسي: دقة الفحوصات (Accuracy)
              LineChartBarData(
                spots: profcontroller.scans.asMap().entries.map((entry) {
                  final scan = Map<String, dynamic>.from(entry.value);
                  return FlSpot(
                    entry.key.toDouble(),
                    profcontroller.scanAccuracy(scan),
                  );
                }).toList(),
                isCurved: true,
                curveSmoothness: 0.35,
                barWidth: 4,
                color: Colors.blueAccent, // لون احترافي متناسق
                isStrokeCapRound: true,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blueAccent.withOpacity(0.15),
                ),
              ),
            ],

            // ضبط حدود الرسم البياني
            minY: 0,
            maxY: 105, // لترك مساحة صغيرة فوق الـ 100%
            minX: 0,
            maxX: (profcontroller.scans.length - 1).toDouble(),
          ),
        ),
      );
    });
  }
}
