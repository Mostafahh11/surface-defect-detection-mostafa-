import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailCard extends StatelessWidget {
  final IconData icon;
  final String title, value;
  final Color iconColor;

  const ProfileDetailCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
          ),
          onPressed: onTap,
          icon: Icon(icon),
          label: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

  Widget buildHeader(BuildContext context ,controller) {
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
          buildAvatar(),
          const SizedBox(height: 15),
          Text(
            controller.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          Text(
            controller.email,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
Widget buildAvatar() {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      // final imageProvider = _resolveAvatarImage(controller.profileImageUrl);
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 4),
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade200,
          // foregroundImage: imageProvider,
          child: Icon(Icons.person_rounded, color: Colors.grey, size: 70),
          // Text(
          //   controller.name[0].capitalize!,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xff1C2541),
          //   ),
          // ),
        ),
      ),

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
      // Obx(() {
      //   if (!controller.isUploading.value) return const SizedBox();
      //   return Positioned.fill(
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.black.withOpacity(0.3),
      //         shape: BoxShape.circle,
      //       ),
      //       child: const Center(
      //         child: CircularProgressIndicator(color: Colors.white),
      //       ),
      //     ),
      //   );
      // }),
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
              // controller.pickImageFromGallery();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined, color: Colors.blue),
            title: const Text("Camera"),
            onTap: () {
              Get.back();
              // controller.takePhoto();
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildSectionTitle(String title) {
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

void showLogoutDialog(controller) {
  Get.defaultDialog(
    title: "Logout",
    middleText: "Are you sure you want to exit?",
    textConfirm: "Confirm",
    textCancel: "Cancel",
    confirmTextColor: Colors.white,
    // buttonColor: Mycolors.org,
    // cancelTextColor: Mycolors.org,
    onConfirm: () => controller.logout(),
  );
}

