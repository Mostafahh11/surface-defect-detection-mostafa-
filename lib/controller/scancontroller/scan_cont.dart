import 'dart:io';
import 'package:defectscan/Api/api.dart';
import 'package:defectscan/Home/Defect_images/scanResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ScanController extends GetxController {
  final picker = ImagePicker();

  // ================== STATE ==================
  var isScanning = false.obs;
  var isLoadingHistory = false.obs;

  // ================== IMAGES ==================
  Rxn<File> selectedImage = Rxn<File>();
  Rxn<File> originalImage = Rxn<File>();

  // ================== RESULT ==================
  var resultImage = "".obs;
  var defectType = "".obs;
  var confidence = 0.0.obs;

  // ================== HISTORY ==================
  var scans = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchScans();
  }

  // ================== PICK ==================
  Future<void> pickImage(ImageSource source) async {
    final img = await picker.pickImage(source: source, imageQuality: 80);
    if (img != null) {
      selectedImage.value = File(img.path);
    }
  }

  // ================== ANALYZE ==================
  Future<void> analyzeImage(File file) async {
    try {
      isScanning.value = true;
      originalImage.value = file;

      final res = await ApiService.detectDefect(file);

      if (res != null && res['success'] == true) {
        final data = res['data'];

        resultImage.value = data['prediction']['annotated_image'] ?? "";

        defectType.value = data['prediction']['class'] ?? "Unknown";

        confidence.value = (data['prediction']['confidence'] ?? 0) * 100;

        await fetchScans(); // تحديث الهيستوري

        Get.to(() => ScanResultScreen());
      }
    } catch (e) {
      debugPrint("Scan error: $e");
      Get.snackbar("Error", "Scan failed");
    } finally {
      isScanning.value = false;
    }
  }

  // ================== HISTORY ==================
  Future<void> fetchScans() async {
    try {
      isLoadingHistory.value = true;

      final data = await ApiService.getScans();

      if (data != null) {
        data.map((e) => Map<String, dynamic>.from(e));
      }
    } catch (e) {
      debugPrint("History error: $e");
    } finally {
      isLoadingHistory.value = false;
    }
  }

  // ================== HELPERS ==================
  Map get lastScan => scans.isNotEmpty ? scans.last : {};
}
