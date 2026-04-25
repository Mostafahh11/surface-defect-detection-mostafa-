import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPieChart extends StatelessWidget {
  final ProfileCont controller;
  const ResultPieChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var latestScan = controller.scans.isNotEmpty
          ? Map<String, dynamic>.from(controller.scans.last)
          : <String, dynamic>{};

      double passed = controller.scanPassed(latestScan).toDouble();
      double defects = controller.scanDefect(latestScan).toDouble();

      return PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: passed,
              color: Colors.greenAccent,
              title: 'Passed',
              radius: 25,
            ),
            PieChartSectionData(
              value: defects,
              color: Colors.pinkAccent,
              title: 'Defects',
              radius: 30,
            ),
          ],
        ),
      );
    });
  }
}
