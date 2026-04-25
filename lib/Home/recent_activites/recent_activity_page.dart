import 'package:defectscan/Home/recent_activites/acitvity_widgets.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart'; // استدعاء الكنترولر
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentActivityPage extends StatelessWidget {
  const RecentActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prof = Get.isRegistered<ProfileCont>()
        ? Get.find<ProfileCont>()
        : Get.put(ProfileCont());

    return Scaffold(
      appBar: AppBar(title: const Text("Recent Activity"), centerTitle: true),
      // استخدمنا Obx عشان لو عملت scan جديد، الصفحة تتحدث لوحدها فوراً
      body: Obx(() {
        if (prof.scans.isEmpty) {
          return const Center(child: Text("No activities yet."));
        }

        return ListView.builder(
          itemCount: prof.scans.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, i) {
            // بنجيب بيانات الفحص (Scan) من المصفوفة
            // عكسنا الترتيب (length - 1 - i) عشان يعرض الأحدث فوق
            var scan = prof.scans[prof.scans.length - 1 - i];

            return ActivityItem(
              id: "#${scan['id'] ?? i}", // رقم الـ ID
              title: prof.scanTitle(scan), // العنوان
              time: scan['created_at'] ?? "Just now", // الوقت
              zone: "Zone ${prof.scanZone(scan)}", // المنطقة
              defects: "${prof.scanDefect(scan)} Defects", // عدد العيوب
              percent: "${prof.scanAccuracy(scan)}%", // النسبة المئوية
              // الأيقونة واللون بنحددهم بناءً على حالة الفحص (لو الـ API باعتها)
              icon: scan['status'] == 'success'
                  ? Icons.check_circle
                  : Icons.error_outline,
              iconColor: scan['status'] == 'success'
                  ? Colors.green
                  : Colors.redAccent,
            );
          },
        );
      }),
    );
  }
}
