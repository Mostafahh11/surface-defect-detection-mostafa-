import 'package:defectscan/controller/scan_cont/detectionCont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImageScreen extends StatelessWidget {
  final ScanController controller = Get.find();

   UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),
      appBar: AppBar(title: const Text('Gallery Upload'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)),
                child: controller.galleryImage.value == null
                    ? _placeholder()
                    : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.file(controller.galleryImage.value!, fit: BoxFit.contain)),
              )),
            ),
            const SizedBox(height: 20),
            Obx(() => controller.galleryImage.value == null
                ? _bigBtn("Select Image", Icons.image, Colors.orange, () => controller.pickFromGallery())
                : Row(children: [
                    Expanded(child: _bigBtn("Change", Icons.edit, Colors.grey, () => controller.pickFromGallery())),
                    const SizedBox(width: 10),
                    Expanded(child: _bigBtn("Scan Now", Icons.analytics, Colors.orange, () => controller.analyzeImage(controller.galleryImage.value!), isLoading: controller.isScanning.value)),
                  ])),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() => Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.cloud_upload_outlined, size: 50, color: Colors.orange.withOpacity(0.5)), const Text("No Image Selected")]);

  Widget _bigBtn(String label, IconData icon, Color color, VoidCallback onTap, {bool isLoading = false}) => ElevatedButton.icon(
    onPressed: isLoading ? null : onTap,
    icon: isLoading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : Icon(icon, color: Colors.white),
    label: Text(label, style: const TextStyle(color: Colors.white)),
    style: ElevatedButton.styleFrom(backgroundColor: color, minimumSize: const Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
  );
}