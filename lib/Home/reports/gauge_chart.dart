import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/constants/colors/colors.dart';

class StorageGauge extends StatelessWidget {
  const StorageGauge({super.key});

  @override
  Widget build(BuildContext context) {
    final profcontroller = Get.isRegistered<ProfileCont>()
        ? Get.find<ProfileCont>()
        : Get.put(ProfileCont());

    return SizedBox(
      height: 180,
      child: Obx(() {
        double accuracy = profcontroller.scanStats['accuracy'] ?? 0;

        // حساب القيمة المتبقية عشان نكمل الدايرة (لكن هنخفيها)
        double remaining = 100 - accuracy;
        if (remaining < 0) remaining = 0;

        return PieChart(
          PieChartData(
            startDegreeOffset: 180, // يبدأ من اليسار
            sectionsSpace: 0,
            centerSpaceRadius: 50,
            // دي أهم نقطة عشان يبان كأنه Gauge: بنرسم نص دايرة وبنخفي الباقي
            sections: [
              // الجزء الملون (الـ Accuracy الحقيقية)
              PieChartSectionData(
                value: accuracy,
                radius: 15,
                showTitle: false,
                color: Mycolors.org, // اللون البرتقالي بتاعك
                badgeWidget: _buildBadge(
                  accuracy,
                ), // إضافة أيقونة صغيرة عند النقطة
                badgePositionPercentageOffset: .98,
              ),
              // الجزء الفارغ (الرمادي)
              PieChartSectionData(
                value: remaining,
                radius: 12,
                showTitle: false,
                color: Colors.grey.withOpacity(0.2),
              ),
              // الجزء السفلي المخفي (عشان يدي شكل نص الدايرة)
              PieChartSectionData(
                value: 100,
                radius: 0,
                showTitle: false,
                color: Colors.transparent,
              ),
            ],
          ),
        );
      }),
    );
  }

  // ودجت اختيارية لو حابب تحط لمسة جمالية في نهاية الخط
  Widget _buildBadge(double val) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Mycolors.org, width: 2),
      ),
    );
  }
}
