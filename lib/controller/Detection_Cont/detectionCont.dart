import 'dart:io';
import 'package:defectscan/Api/api.dart';
import 'package:defectscan/Home/Defect_images/scanResultScreen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ScanController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var isScanning = false.obs;

  // متغيرات الصور
  Rxn<File> cameraImage = Rxn<File>();
  Rxn<File> galleryImage = Rxn<File>();
  Rxn<File> originalImageForReport = Rxn<File>();

  // نتائج التحليل
  var annotatedImageBase64 = "".obs;
  var defectType = "".obs;
  var confidence = 0.0.obs;

  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (image != null) cameraImage.value = File(image.path);
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) galleryImage.value = File(image.path);
  }

  Future<void> analyzeImage(File file) async {
    try {
      isScanning.value = true;
      originalImageForReport.value = file;

      var result = await ApiService.detectDefect(
        file,
      ); // ميثود التحليل في الـ API

      if (result != null && result['success'] == true) {
        var data = result['data'];
        annotatedImageBase64.value =
            data['prediction']['annotated_image'] ?? "";
        defectType.value = data['prediction']['class'] ?? "Unknown";
        confidence.value = (data['prediction']['confidence'] ?? 0.0) * 100;

        Get.to(() => ScanResultScreen());
      } else {
        Get.snackbar(
          "Error",
          "Analysis failed, please try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Check your internet connection",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isScanning.value = false;
    }
  }

  void clearAllData() {
    cameraImage.value = null;
    galleryImage.value = null;
    originalImageForReport.value = null;
    annotatedImageBase64.value = "";
    defectType.value = "";
    confidence.value = 0.0;
  }
}
