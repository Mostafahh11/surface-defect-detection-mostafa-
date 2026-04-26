import 'package:defectscan/Home/Defect_images/scanResultScreen.dart';
import 'package:defectscan/Home/Defect_images/take_photo.dart';
import 'package:defectscan/Home/Defect_images/upload_image.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/controller/statistics%20cont/stat.dart';
// اعمل import لملف الـ ThemeController بتاعك هنا

Widget profileCard(BuildContext context) {
  // 1. استدعاء الكنترولرات بأمان من داخل الدالة
  final profController = Get.isRegistered<ProfileCont>()
      ? Get.find<ProfileCont>()
      : Get.put(ProfileCont());
  final statController = Get.isRegistered<StatisticsController>()
      ? Get.find<StatisticsController>()
      : Get.put(StatisticsController());
  final themeController = Get.find<ThemeController>();

  return Obx(() {
    int totalScans = statController.scans.length;
    
    double successRate =
        double.tryParse(
          (statController.stats['success_rate'] ?? 20).toString(),
        ) ??
        0.0;
    double progressFraction = (totalScans / 60).clamp(0.0, 1.0);

    bool isDark = themeController.isDarkMode.value;
    String userName = profController.name.value.isNotEmpty
        ? profController.name.value
        : "User";

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).colorScheme.primary : Mycolors.org,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good Morning 👋',
                style: TextStyle(
                  fontSize: 15,
                  color: isDark ? Colors.grey : Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Level 5',
                  style: TextStyle(
                    fontSize: 15,
                    color: isDark ? Colors.grey : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // الاسم بيتقرأ صح من البروفايل دلوقتي
          Text(
            userName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.grey : Colors.white,
            ),
          ),
          Text(
            'Senior Quality Inspector',
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Colors.grey : Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s scans',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.grey : Colors.white,
                    ),
                  ),
                  Text(
                    '$totalScans/60',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.grey : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 4,
                    width: 80,
                    color: Colors.white30,
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progressFraction,
                      child: Container(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Success rate',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.grey : Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${successRate.toInt()}%',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.grey : Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          value: successRate / 100,
                          strokeWidth: 3,
                          color: Colors.blue,
                          backgroundColor: Colors.white30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  });
}

Widget cameraScan(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Get.to(() => TakeImageScreen());
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.camera_alt_outlined, color: Colors.green),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start New Scan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'AI-Powered Detection',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_circle_right_outlined),
        ],
      ),
    ),
  );
}

Widget secondaryActions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      smallAction(
        Icons.upload_outlined,
        'Upload From gallery',
        'process local image Files',

        Colors.orange,
        () {
          Get.to(() => UploadImageScreen());
        },
      ),
      const SizedBox(width: 15),
      smallAction(
        Icons.layers_outlined,
        'Scans',
        'See Your Scans',
        Colors.indigo,
        () {
          Get.to(() => ScanResultScreen());
        },
      ),
    ],
  );
}

Widget smallAction(
  IconData icon,
  String title,
  String subtitle,

  Color color,
  void Function() onTap,
) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
