import 'dart:io';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Titlebar extends StatelessWidget {
  Titlebar({super.key});
  final ProfileCont controller = Get.isRegistered<ProfileCont>()
      ? Get.find<ProfileCont>()
      : Get.put(ProfileCont());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Defect Scan",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.notifications_none_outlined),
              const SizedBox(width: 15),
              Obx(() {
                // تحديد مصدر الصورة
                ImageProvider? getImageProvider() {
                  // 1. لو مختار صورة جديدة من الموبايل
                  if (controller.selectedImage.value != null) {
                    return FileImage(
                      File(controller.selectedImage.value!.path),
                    );
                  }
                  // 2. لو فيه صورة جاية من السيرفر
                  if (controller.profileImageBase64.value.isNotEmpty) {
                    return NetworkImage(controller.profileImageBase64.value);
                  }
                  // 3. لا يوجد صورة
                  return null;
                }

                return CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[200],
                  // بنمرر الـ ImageProvider هنا
                  backgroundImage: getImageProvider(),
                  // الأيقونة بتظهر فقط لو مفيش أي صورة (لا محلية ولا من السيرفر)
                  child:
                      (controller.selectedImage.value == null &&
                          controller.profileImageBase64.value.isEmpty)
                      ? const Icon(Icons.person, size: 20)
                      : null,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
