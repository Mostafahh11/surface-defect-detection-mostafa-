import 'dart:convert'; // ضروري عشان الـ base64Decode
import 'package:defectscan/profile/profile_page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';

// --- الـ Header بشكل فخم ونظيف ---
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final profcontroller = Get.find<ProfileCont>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      // 1. كل العمليات المنطقية بتتعمل هنا قبل الـ return
      final imageStr = profcontroller.profileImageBase64.value;
      ImageProvider? imageProvider;

      if (imageStr.isNotEmpty) {
        if (imageStr.startsWith('http')) {
          imageProvider = NetworkImage(imageStr); // صورة من السيرفر
        } else {
          try {
            imageProvider = MemoryImage(base64Decode(imageStr)); // صورة Base64
          } catch (_) {}
        }
      }

      // 2. هنا بنبدأ نرسم الـ UI بعد ما جهزنا الـ imageProvider
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Row(
          children: [
            // عرض الصورة المختارة أو أيقونة افتراضية
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue.withOpacity(0.1),
              backgroundImage: imageProvider, // حطينا المتغير الجاهز هنا
              child: imageProvider == null
                  ? const Icon(Icons.person, size: 40, color: Colors.blue)
                  : null,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profcontroller.name.value.isEmpty
                        ? "Mostafa"
                        : profcontroller.name.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    profcontroller.email.value,
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => MyProfileScreen());
              }, 
              icon: const Icon(
                Icons.edit_note_rounded,
                color: Colors.blue,
                size: 28,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// --- SettingTile ---
class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  const SettingTile({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (iconColor ?? Colors.blue).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor ?? Colors.blue, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      trailing: trailing ??
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
    );
  }
}

// --- SectionHeader ---
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 10, left: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}