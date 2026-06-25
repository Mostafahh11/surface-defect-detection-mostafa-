import 'package:defectscan/Home/Defect_images/scanResultScreen.dart';
import 'package:defectscan/Home/Defect_images/take_photo.dart';
import 'package:defectscan/Home/Defect_images/upload_image.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/controller/statistics cont/stat.dart';

Widget profileCard(BuildContext context) {
  final profController = Get.find<ProfileCont>();
  final statController = Get.find<StatisticsController>();
  final themecont = Get.find<ThemeController>();
  final isDark = themecont.isDarkMode.value;

  return Obx(() {
    int todayscan = profController.todayscans;
    String userrole = profController.roleTitle;
    double progressFraction = (todayscan / 60);

    String userName = profController.name;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isDark ? Colors.white.withOpacity(0.06) : DeepSea.org,
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.12) : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.30),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
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
                  color: isDark
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withOpacity(0.06) : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  userrole,
                  style: TextStyle(
                    fontSize: 15,
                    color: isDark
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            userName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.grey[50],
            ),
          ),
          Text(
            'Senior Quality Inspector',
            style: TextStyle(
              fontSize: 13,
              color: isDark
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
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
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.white,
                    ),
                  ),
                  Text(
                    '$todayscan/60',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.white,
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
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${statController.accuracy}%',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          value: statController.accuracy / 100,
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
