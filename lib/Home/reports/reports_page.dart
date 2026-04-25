import 'package:defectscan/Home/reports/gauge_chart.dart';
import 'package:defectscan/Home/reports/pie_chart.dart';
import 'package:defectscan/Home/reports/statistics_chart.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedReportPage extends StatelessWidget {
  const DetailedReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profcontroller = Get.isRegistered<ProfileCont>()
        ? Get.find<ProfileCont>()
        : Get.put(ProfileCont());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Detailed Report"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Obx(() {
          // جلب آخر فحص أو خريطة فاضية لو مفيش بيانات
          final latest = profcontroller.scans.isNotEmpty
              ? Map<String, dynamic>.from(profcontroller.scans.last)
              : <String, dynamic>{};
          final totalScans = profcontroller.scans.length;

          return ListView(
            padding: const EdgeInsets.all(15),
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFDECEB),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                ),
                title: const Text(
                  "Weekly Overview",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Defects detected per day"),
                trailing: Icon(Icons.trending_down, color: Colors.red[400]),
              ),

              const SizedBox(height: 10),

              // 1. Performance Trend Chart
              Container(
                padding: const EdgeInsets.all(16),
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Performance Trend",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Mycolors.org,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          color: Mycolors.org,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Export",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // الشارت هيرسم "أصفار" لو الداتا فاضية بفضل الـ Logic اللي جوه StatisticsChart
                    Expanded(
                      child: StatisticsChart(profcontroller: profcontroller),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. Bottom Charts Row
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Result Pie Chart Card
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Results",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " (Latest)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 130,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "$totalScans",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ResultPieChart(controller: profcontroller),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            // عرض أصفار لو الداتا Null
                            Wrap(
                              runSpacing: 10,
                              spacing: 8,
                              alignment: WrapAlignment.center,
                              children: [
                                _valueWithText(
                                  profcontroller.scanPassed(latest),
                                  "Healthy",
                                  Colors.greenAccent,
                                ),
                                _valueWithText(
                                  profcontroller.scanDefect(latest),
                                  "Defects",
                                  Colors.redAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Accuracy Gauge Card
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Overall Accuracy",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(height: 120, child: StorageGauge()),
                            const SizedBox(height: 10),
                            Text(
                              "${profcontroller.scanStats['accuracy'] ?? 0}%",
                              style: TextStyle(
                                color: Mycolors.org,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _valueWithText(int val, String text, Color color) {
    return SizedBox(
      width: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$val",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_drop_up, color: color, size: 16),
            ],
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey[600],
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
