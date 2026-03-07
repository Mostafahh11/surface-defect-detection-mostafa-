import 'dart:io';

import 'package:defectscan/profile/edit_profile/edit_from_inside.dart/edit_profile_form_inside.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Obx(() {
                  // لو مفيش صورة → يظهر CircleAvatar فارغ
                  if (controller.selectedImage.value == null) {
                    return CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    );
                  }

                  // لو فيه صورة → تظهر
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(
                      File(controller.selectedImage.value!.path),
                    ),
                  );
                }),

                // زر Edit
                IconButton(
                  onPressed: () {
                    showEditPhotoSheet(
                      context,
                    ); // يفتح BottomSheet لاختيار صورة
                  },
                  icon: const Icon(Icons.edit, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 20),
            ProfileItem(title: "Name", value: "Mostafa Hassan"),
            Divider(),
            ProfileItem(title: "Email", value: "mostafa@gmail.com"),
            Divider(),
            ProfileItem(title: "Phone", value: "+20108838220"),
            Divider(),
            ProfileItem(title: "Address", value: "cairo"),
            Divider(),
          ],
        ),
      ),
    );
  }
}
