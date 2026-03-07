import 'dart:io';

import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/image_picker_cont/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImagePage extends StatelessWidget {
  UploadImagePage({super.key});

  final MediaController controller = Get.put(MediaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Upload Image',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDE2E9),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Obx(() {
                  if (controller.galleryImages.isEmpty) {
                    return Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 100,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    );
                  }

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(controller.galleryImages.first.path),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 Upload Button
            ElevatedButton(
              onPressed: () {
                controller.pickImageFromGallery();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.org,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Upload Image',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
