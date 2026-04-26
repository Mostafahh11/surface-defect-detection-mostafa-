import 'package:defectscan/controller/scan_cont/detectionCont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeImageScreen extends StatelessWidget {
  final ScanController controller = Get.find();

   TakeImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),
      appBar: AppBar(title: const Text('Live Scan'), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Obx(() => controller.cameraImage.value == null
                    ? const Center(child: Icon(Icons.camera_alt, color: Colors.white24, size: 80))
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(controller.cameraImage.value!, fit: BoxFit.cover),
                          if (controller.isScanning.value) const Center(child: CircularProgressIndicator(color: Colors.orange)),
                        ],
                      )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _smallBtn(Icons.refresh, () => controller.cameraImage.value = null),
                _mainCircleBtn(Icons.camera_alt, () => controller.pickFromCamera()),
                Obx(() => controller.cameraImage.value != null
                    ? _smallBtn(Icons.check, () => controller.analyzeImage(controller.cameraImage.value!), isAction: true)
                    : const SizedBox(width: 60)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallBtn(IconData icon, VoidCallback onTap, {bool isAction = false}) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 60, height: 60,
      decoration: BoxDecoration(color: isAction ? Colors.orange.withOpacity(0.2) : Colors.white, shape: BoxShape.circle),
      child: Icon(icon, color: isAction ? Colors.orange : Colors.black54),
    ),
  );

  Widget _mainCircleBtn(IconData icon, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 80, height: 80,
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 15)]),
      child: Icon(icon, color: Colors.white, size: 35),
    ),
  );
}