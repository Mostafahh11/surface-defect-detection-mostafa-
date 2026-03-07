import 'dart:io';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/image_picker_cont/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeImageScreen extends StatelessWidget {
  TakeImageScreen({super.key});

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
          'Take Photo',
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
                  if (controller.selectedImage.value == null) {
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
                      File(controller.selectedImage.value!.path),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.takePhoto();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Mycolors.org,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Take Image',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Obx(() {
                    if (controller.selectedImage.value != null) {
                      return ElevatedButton(
                        onPressed: () => controller.selectedImage.value = null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Delete Image",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
