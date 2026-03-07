import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ResultPieChart extends StatelessWidget {
  const ResultPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 50,
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              value: 40,
              radius: 25,
              showTitle: false,
              color: Colors.pinkAccent,
            ),
            PieChartSectionData(
              value: 30,
              radius: 25,
              showTitle: false,
              color: Colors.greenAccent,
            ),
            PieChartSectionData(
              value: 20,
              radius: 25,
              showTitle: false,
              color: Colors.orangeAccent,
            ),
            PieChartSectionData(
              value: 10,
              radius: 15,
              showTitle: false,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
