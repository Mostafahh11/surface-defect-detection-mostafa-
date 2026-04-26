import 'package:defectscan/Home/anlytics_grids/analytics_widgets.dart';
import 'package:defectscan/Home/reports/reports_page.dart';
import 'package:defectscan/controller/statistics%20cont/stat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsGrid extends StatelessWidget {
  const AnalyticsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final statsController = Get.isRegistered<StatisticsController>()
        ? Get.find<StatisticsController>()
        : Get.put(StatisticsController());

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          return ListView(
            children: [
              const SizedBox(height: 20),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Analytics results",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => DetailedReportPage()),
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // صندوق الرؤى السريعة الجديد (Quick Insights)
              QuickInsightsWidget(
                accuracy: statsController.accuracy,
                totalScans: statsController.scans.length,
              ),

              const SizedBox(height: 15),

              // شبكة الإحصائيات (Grid)
              GridView.builder(
                itemCount: statsController.dynamicStateCards.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, i) {
                  return StatCardWidget(
                    data: statsController.dynamicStateCards[i],
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          );
        }),
      ),
    );
  }
}
