import 'package:defectscan/Home/recent_activites/acitvity_widgets.dart';
import 'package:defectscan/controller/defectCategories/defectcategroies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentActivityPage extends StatelessWidget {
  const RecentActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DefectCategoryController());

    return Scaffold(
      appBar: AppBar(title: const Text("Recent Activity"), centerTitle: true),

      body: Obx(() {
        final list = controller.recentactivity;

        if (controller.loading.value && list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (list.isEmpty) {
          return const Center(child: Text("No activities yet."));
        }

        return ListView.builder(
          itemCount: list.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, i) {
            // أحدث أولًا
            final scan = list[list.length - 1 - i];

            // حسب الموديل بتاعك (عدّل لو الأسماء مختلفة)
            final defectsCount = scan.totalDefects;
            final accuracy = scan.totalImages;

            final isSuccess = scan.status == 'success' || defectsCount == 0;

            return ActivityItem(
              id: "#${scan.scanId}",
              title: scan.scanType,
              time: scan.createdAt,
              zone: "Zone A", 
              defects: "$defectsCount",
              percent: "$accuracy%",
              icon: isSuccess ? Icons.check_circle : Icons.error_outline,
              iconColor: isSuccess ? Colors.green : Colors.redAccent,
            );
          },
        );
      }),
    );
  }
}
