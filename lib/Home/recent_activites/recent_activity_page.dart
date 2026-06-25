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

      body: RefreshIndicator(
        onRefresh: () async {
          await controller.loadCategories();
        },
        child: Obx(() {
          final list = controller.recentactivity;

          if (controller.loading.value && list.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (list.isEmpty) {
            return const Center(child: Text("No activities yet."));
          }

          final reversedList = list.reversed.toList();

          return ListView.builder(
            itemCount: reversedList.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, i) {
              final scan = reversedList[i];

              final defectsCount = scan.totalDefects;

              final isSuccess = scan.status == 'completed';

              return ActivityItem(
                id: "#${scan.scanId}",
                title: scan.scanType,
                time: scan.createdAt,
                zone: "Zone A",
                defects: "$defectsCount",
                percent: "${scan.totalImages} images",
                icon: isSuccess ? Icons.check_circle : Icons.error_outline,
                iconColor: isSuccess ? Colors.green : Colors.redAccent,
              );
            },
          );
        }),
      ),
    );
  }
}
