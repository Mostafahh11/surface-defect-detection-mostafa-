import 'package:defectscan/Home/history/history_widgets.dart';
import 'package:defectscan/Home/recent_activites/recent_activity_page.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart'; // تأكد من المسار
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final profcontroller = Get.isRegistered<ProfileCont>()
        ? Get.find<ProfileCont>()
        : Get.put(ProfileCont());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // عنوان الصفحة
          Center(
            child: Text(
              'History',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            "Defect Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),

          // قسم التصنيفات - خليناه Obx عشان يحدث نفسه أول ما الداتا تيجي
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: colorScheme.outlineVariant.withOpacity(0.4),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Obx(() {
                  // لو مفيش بيانات خالص اعرض رسالة فاضية بدل ايرور
                  if (profcontroller.scans.isEmpty) {
                    return const Center(
                      child: Text("No scans found yet. Start scanning!"),
                    );
                  }

                  // هنا هنعرض التصنيفات بناءً على آخر فحص (Latest Scan)
                  final latest = profcontroller.scans.last;

                  return ListView(
                    padding: const EdgeInsets.all(12),
                    children: [
                      // تصنيف الخدوش
                      DefectCategoryRow(
                        icon: Icons.scuba_diving,
                        label: "Scratches",
                        cases: "${latest['scratches_count'] ?? 0}",
                        percentage: (latest['scratches_percent'] ?? 0.0) / 100,
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withOpacity(0.3),
                      ),

                      // تصنيف الصدأ
                      DefectCategoryRow(
                        icon: Icons.whatshot_outlined,
                        label: "Corrosion",
                        cases: "${profcontroller.scanDefect(latest)}",
                        percentage: profcontroller.scanAccuracy(latest) / 100,
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withOpacity(0.3),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // قسم النشاطات الأخيرة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Activity",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Total Scans: ${profcontroller.scans.length}",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Get.to(() => RecentActivityPage()),
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
