import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}k",
                    style: TextStyle(color: Colors.grey[700]),
                  );
                },
              ),
            ),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}k",
                    style: TextStyle(color: Colors.grey[700]),
                  );
                },
              ),
            ),

            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 1),
                FlSpot(2, 3),
                FlSpot(4, 4),
                FlSpot(6, 3.8),
              ],
              isCurved: true,
              barWidth: 3,
              color: Colors.greenAccent,
            ),
            LineChartBarData(
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 2),
                FlSpot(2, 3),
                FlSpot(3, 4),
              ],
              isCurved: true,
              barWidth: 3,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
