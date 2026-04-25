import 'package:defectscan/Home/anlytics_grids/analytics_widgets.dart';
import 'package:defectscan/Home/reports/reports_page.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/controller/statistics cont/stat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsGrid extends StatelessWidget {
  const AnalyticsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final profcontroller = Get.isRegistered<ProfileCont>()
        ? Get.find<ProfileCont>()
        : Get.put(ProfileCont());
    final statsController = Get.isRegistered<StatisticsController>()
        ? Get.find<StatisticsController>()
        : Get.put(StatisticsController());

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(() {
          final scans = profcontroller.scans;
          final stats = statsController.stats;

          return ListView(
            children: [
              const SizedBox(height: 10),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Analytics Results",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => DetailedReportPage()),
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 1. Overall Performance Tile
              ModernStatTile(
                icon: Icons.auto_awesome,
                title: "Overall Performance",
                subtitle: "Average accuracy is ${statsController.accuracy}%",
                caption: "Based on ${scans.length} recent inspections",
                color: Colors.blue,
              ),

              // 2. Success Rate Tile
              ModernStatTile(
                icon: Icons.speed_rounded,
                title: "Success Rate",
                subtitle:
                    "Your efficiency is at ${stats['success_rate'] ?? 0}%",
                caption:
                    "Passed ${statsController.passed} / Defects ${statsController.defects}",
                color: Colors.green,
              ),

              // 3. Last Inspection Tile
              ModernStatTile(
                icon: Icons.update_rounded,
                title: "Last Inspection",
                subtitle: scans.isNotEmpty
                    ? "Zone: ${scans.last['zone'] ?? 'A'}"
                    : "No recent scans",
                caption: scans.isNotEmpty
                    ? "Score: ${profcontroller.scanAccuracy(Map<String, dynamic>.from(scans.last))}% - ${profcontroller.scanTitle(Map<String, dynamic>.from(scans.last))}"
                    : "Start your first scan",
                color: Colors.orange,
              ),

              const SizedBox(height: 20),

              // 4. GridView (Always shows, even with zeros)
              GridView.builder(
                itemCount: profcontroller.dynamicStateCards.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, i) {
                  return StatCardWidget(
                    data: profcontroller.dynamicStateCards[i],
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }
}
