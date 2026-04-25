import 'dart:convert';
import 'package:defectscan/controller/Detection_Cont/detectionCont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanResultScreen extends StatelessWidget {
  final ScanController controller = Get.find();

  ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analysis Result")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Original Image (Before)
            Obx(() {
              if (controller.originalImageForReport.value == null) {
                return const SizedBox.shrink();
              }
              return _buildImageSection(
                title: "Original Image (Before)",
                child: Image.file(
                  controller.originalImageForReport.value!,
                  fit: BoxFit.cover,
                ),
              );
            }),

            // Annotated Image (After)
            Obx(() {
              if (controller.annotatedImageBase64.isEmpty) {
                return const SizedBox.shrink();
              }
              return _buildImageSection(
                title: "Annotated Image (After)",
                child: Image.memory(
                  base64Decode(controller.annotatedImageBase64.value),
                  fit: BoxFit.cover,
                ),
              );
            }),

            const SizedBox(height: 20),
            _buildInfoCard(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          _infoRow("Defect Type", controller.defectType.value),
          const Divider(),
          _infoRow("Confidence", "${(controller.confidence.value) / 100}%"),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String val) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: const TextStyle(color: Colors.grey)),
      Text(
        val,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ],
  );
}
