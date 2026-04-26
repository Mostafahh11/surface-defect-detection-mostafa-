import 'dart:convert'; // مهم عشان فك تشفير الـ Base64
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

              // الأفاتار مع الـ Obx
              Obx(() {
                final imageStr = controller.profileImageBase64.value;
                ImageProvider? imageProvider;

                // 1. معالجة الصورة بشكل آمن (سواء كانت رابط أو Base64)
                if (imageStr.isNotEmpty) {
                  if (imageStr.startsWith('http')) {
                    imageProvider = NetworkImage(imageStr);
                  } else {
                    try {
                      imageProvider = MemoryImage(base64Decode(imageStr));
                    } catch (_) {}
                  }
                }

                // 2. عرض الـ CircleAvatar
                return CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: imageProvider,
                  child: imageProvider == null
                      ? const Icon(Icons.person, size: 20, color: Colors.blue)
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
