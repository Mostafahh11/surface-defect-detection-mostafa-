import 'dart:convert';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/profile/profile_page/profile_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final ProfileCont controller = Get.put(ProfileCont());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 10),

            // قسم المعلومات الشخصية
            _buildSectionTitle("Personal Information"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                // 1. تظبيط التاريخ هنا عشان يتحدث تلقائي
                String formattedDate = "N/A";
                if (controller.createdAt.value.isNotEmpty) {
                  try {
                    DateTime parsedDate = DateTime.parse(
                      controller.createdAt.value,
                    );
                    formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
                  } catch (_) {}
                }

                // 2. تظبيط شكل الـ Role
                String roleName =
                    controller.userRole.value.name.capitalizeFirst ?? 'User';

                return Column(
                  children: [
                    ProfileDetailCard(
                      icon: Icons.phone_android_rounded,
                      title: "Phone Number",
                      value: controller.phone.value.isNotEmpty
                          ? controller.phone.value
                          : "N/A",
                      iconColor: Colors.blue,
                    ),
                    ProfileDetailCard(
                      icon: Icons.location_on_rounded,
                      title: "Location",
                      value: "Cairo, Egypt",
                      iconColor: Colors.orange,
                    ),
                    ProfileDetailCard(
                      icon: Icons.verified_user_rounded,
                      title: "Account Status",
                      value: "Verified Professional, $roleName",
                      iconColor: Colors.green,
                    ),
                    ProfileDetailCard(
                      icon: Icons.timelapse_outlined,
                      title: "Account Created",
                      value: formattedDate,
                      iconColor: Colors.green,
                    ),
                  ],
                );
              }),
            ),

            const SizedBox(height: 5),

            // قسم الإعدادات والأكشنز
            _buildSectionTitle("Settings & Actions"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ActionButton(
                    label: "Edit Profile Info",
                    icon: Icons.edit_note_rounded,
                    color: Mycolors.org,
                    onTap: () {}, // سيتم إضافة الانتقال لصفحة التعديل
                  ),
                  ActionButton(
                    label: "Logout",
                    icon: Icons.logout_rounded,
                    color: Colors.redAccent,
                    onTap: () => _showLogoutDialog(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // هيدر الصفحة بتصميم زجاجي متدرج
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff0B132B), Color(0xff1C2541)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          _buildAvatar(),
          const SizedBox(height: 15),
          Obx(
            () => Text(
              controller.name.value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          Obx(
            () => Text(
              controller.email.value,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ودجت الأفاتار الأنظف والأخف
  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Obx(() {
          final serverImage = controller.profileImageBase64.value;
          ImageProvider? imageProvider;

          if (serverImage.isNotEmpty) {
            if (serverImage.startsWith('http')) {
              imageProvider = NetworkImage(serverImage);
            } else {
              try {
                imageProvider = MemoryImage(base64Decode(serverImage));
              } catch (_) {}
            }
          }

          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 4,
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: imageProvider,
              child: imageProvider == null
                  ? Text(
                      controller.name.value.isNotEmpty
                          ? controller.name.value[0].toUpperCase()
                          : 'U',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C2541),
                      ),
                    )
                  : null,
            ),
          );
        }),

        // زرار الكاميرا
        GestureDetector(
          onTap: () => _showEditPhotoSheet(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),

        // علامة التحميل (Loading)
        Obx(() {
          if (!controller.isUploading.value) return const SizedBox();
          return Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          );
        }),
      ],
    );
  }

  void _showEditPhotoSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Change Profile Photo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.photo_library_outlined,
                color: Colors.blue,
              ),
              title: const Text("Gallery"),
              onTap: () {
                Get.back();
                controller.pickImageFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
              ),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                controller.takePhoto();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to exit?",
      textConfirm: "Confirm",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () => controller.logout(),
    );
  }
}
