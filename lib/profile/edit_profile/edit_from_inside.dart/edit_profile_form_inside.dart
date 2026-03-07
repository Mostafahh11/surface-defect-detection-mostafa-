import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ProfileCont controller = Get.find();

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;
  const ProfileItem({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

void showEditPhotoSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
          const SizedBox(height: 10),

          // اختيار من الكاميرا
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take Photo"),
            onTap: () {
              controller.takePhoto(); // تحفظ الصورة مباشرة في selectedImage
              Get.back(); // يغلق الـ BottomSheet
            },
          ),

          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Choose from Gallery"),
            onTap: () {
              controller.pickImageFromGallery();  
              Get.back(); 
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
