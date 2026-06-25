import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/profile/profile_page/profile_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final ProfileCont controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context ,controller),
            const SizedBox(height: 10),
            buildSectionTitle("Personal Information"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                return Column(
                  children: [
                    ProfileDetailCard(
                      icon: Icons.phone_android_rounded,
                      title: "Phone Number",
                      value: controller.phone,
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
                      value: controller.roleTitle,
                      iconColor: Colors.green,
                    ),
                    ProfileDetailCard(
                      icon: Icons.account_box,
                      title: "Total Scans",
                      value: controller.totalscans.toString(),
                      iconColor: Colors.green,
                    ),
                  ],
                );
              }),
            ),

            const SizedBox(height: 5),

            buildSectionTitle("Settings & Actions"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ActionButton(
                    label: "Edit Profile Info",
                    icon: Icons.edit_note_rounded,
                    color: Colors.black,
                    onTap: () {}, 
                  ),
                  ActionButton(
                    label: "Logout",
                    icon: Icons.logout_rounded,
                    color: Colors.redAccent,
                    onTap: () => showLogoutDialog(controller),
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



  // ImageProvider? _resolveAvatarImage(String serverImage) {
  //   final raw = serverImage.trim().replaceAll('\\/', '/').replaceAll('\\', '/');
  //   if (raw.isEmpty) return null;

  //   final normalized = raw.trim();
  //   final isHttp = RegExp(
  //     r'^(https?:)?//',
  //     caseSensitive: false,
  //   ).hasMatch(normalized);
  //   if (isHttp) {
  //     var url = normalized.startsWith('http')
  //         ? normalized
  //         : 'https:$normalized';
  //     if (url.contains('/storage/avatars/') &&
  //         !url.contains('/public/storage/avatars/')) {
  //       url = url.replaceFirst('/storage/avatars/', '/public/storage/avatars/');
  //     }
  //     return NetworkImage(url);
  //   }

  //   final path = normalized.startsWith('/')
  //       ? normalized
  //       : '/${normalized.replaceFirst(RegExp(r'^public/'), '')}';
  //   if (path.contains('/storage/avatars') ||
  //       path.contains('/public/storage/avatars')) {
  //     return NetworkImage('${ApiLinkes.baseurl}$path');
  //   }

  //   try {
  //     return MemoryImage(base64Decode(normalized));
  //   } catch (_) {
  //     if (normalized.contains('/') || normalized.contains('\\')) {
  //       return FileImage(File(normalized));
  //     }
  //   }
  //   return null;
  // }
}
