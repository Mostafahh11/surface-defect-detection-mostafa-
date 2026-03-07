import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StorageGauge extends StatelessWidget {
  const StorageGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PieChart(
        PieChartData(
          startDegreeOffset: 180,
          sectionsSpace: 2,
          centerSpaceRadius: 60,
          sections: [
            PieChartSectionData(value: 70, radius: 20),
            PieChartSectionData(value: 30, radius: 20),
          ],
        ),
      ),
    );
  }
}
