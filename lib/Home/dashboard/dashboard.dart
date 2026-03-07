// ignore_for_file: deprecated_member_use

import 'package:defectscan/Home/take_photo/take_photo.dart';
import 'package:defectscan/Home/upload/upload_image.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ThemeController controller = Get.find();

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileCard(),
            const SizedBox(height: 20),
            cameraScan(context),
            const SizedBox(height: 15),
            secondaryActions(context),
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: controller.isDarkMode.value ? Colors.white : Mycolors.org,
          borderRadius: BorderRadius.circular(20),
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
                    color: controller.isDarkMode.value
                        ? Mycolors.org
                        : Colors.white,

                    fontSize: 15,
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
                      color: controller.isDarkMode.value
                          ? Mycolors.org
                          : Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Mostafa hassan',
              style: TextStyle(
                color: controller.isDarkMode.value
                    ? Mycolors.org
                    : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Senior Quality Inspector',
              style: TextStyle(
                color: controller.isDarkMode.value
                    ? Mycolors.org
                    : Colors.white,
                fontSize: 13,
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
                        color: controller.isDarkMode.value
                            ? Mycolors.org
                            : Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '14/60',
                      style: TextStyle(
                        color: controller.isDarkMode.value
                            ? Mycolors.org
                            : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 4,
                      width: 80,
                      color: Colors.grey[100],
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.3,
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
                        color: controller.isDarkMode.value
                            ? Mycolors.org
                            : Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '70.5%',
                          style: TextStyle(
                            color: controller.isDarkMode.value
                                ? Mycolors.org
                                : Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            value: 0.75,
                            strokeWidth: 3,
                            color: Colors.blue,
                            backgroundColor: Colors.white70,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
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
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'AI-Powered Detection',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_circle_right_outlined, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget secondaryActions(BuildContext context) {
    return Row(
      children: [
        smallAction(
          Icons.upload_outlined,
          'Upload image from gallery',
          Colors.orange,
          () {
            Get.to(() => UploadImagePage());
          },
        ),
        const SizedBox(width: 15),
        smallAction(
          Icons.layers_outlined,
          'Batch Scan multiple items',
          Colors.indigo,
          () {},
        ),
      ],
    );
  }

  Widget smallAction(
    IconData icon,
    String title,
    Color color,
    void Function() onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200),
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
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
