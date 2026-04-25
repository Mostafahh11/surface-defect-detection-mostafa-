import 'dart:io';

import 'package:defectscan/Api/api.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCont extends GetxController {
  // ================== USER ==================
  var id = 0.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  RxString profileImageBase64 = ''.obs;
  RxString createdAt = ''.obs;
  RxString updatedAt = ''.obs;
  Rx<UserRole> userRole = UserRole.user.obs;

  final ImagePicker picker = ImagePicker();

  RxList<Map<String, dynamic>> scans = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> settings = <String, dynamic>{}.obs;
  RxMap<String, dynamic> scanStats = <String, dynamic>{}.obs;

  Rxn<XFile> selectedImage = Rxn<XFile>();
  RxBool isUploading = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    refreshProfile();
  }

  Future<void> refreshProfile() async {
    loadUserDataFromStorage();
    await syncWithApi();
    await fetchScansFromApi();
    await fetchScanStatistics();
  }

  Future<void> fetchScanStatistics() async {
    final stats = await ApiService.getScanStatistics();
    if (stats != null) {
      scanStats.value = stats;
    }
  }

  Future<void> fetchScansFromApi() async {
    final data = await ApiService.getScans();
    if (data.isNotEmpty) {
      scans.assignAll(data.cast<Map<String, dynamic>>());
    }
  }

  Future<void> syncWithApi() async {
    try {
      final freshData = await ApiService.getMe();
      if (freshData != null) {
        updateInternalVariables(freshData);
        await StorageService.updateUser(freshData);
      }
    } catch (e) {
      debugPrint("Sync error: $e");
    }
  }

  void updateInternalVariables(Map<String, dynamic> data) {
    var user = data['user'] ?? data;
    if (user is! Map<String, dynamic>) return;

    id.value = user['id'] ?? 0;
    name.value = (user['full_name'] ?? '').toString();
    email.value = (user['email'] ?? '').toString();
    phone.value = (user['phone'] ?? '').toString();
    createdAt.value = (user['created_at'] ?? '').toString();
    updatedAt.value = (user['updated_at'] ?? '').toString();

    final avatar = (user['avatar'] ?? user['image']);
    if (avatar != null && avatar.toString().isNotEmpty) {
      profileImageBase64.value = avatar.toString();
      StorageService.shared.setString('user_avatar_base64', avatar.toString());
    }

    String roleStr = user['role']?.toString().toLowerCase() ?? 'user';
    userRole.value = roleStr == 'admin' ? UserRole.admin : UserRole.user;

    final rawScans = user['scans'] ?? [];
    if (rawScans is List) {
      scans.assignAll(rawScans.cast<Map<String, dynamic>>());
    }

    final rawSettings = user['settings'] ?? {};
    if (rawSettings is Map) {
      settings.assignAll(rawSettings.cast<String, dynamic>());
    }
  }

  void loadUserDataFromStorage() {
    final localData = StorageService.getUser();
    if (localData != null) {
      updateInternalVariables(localData);
    }

    final savedImage = StorageService.shared.getString('user_avatar_base64');
    if (savedImage != null && savedImage.isNotEmpty) {
      profileImageBase64.value = savedImage;
    }
  }

  Future<void> uploadImage(File file) async {
    isUploading.value = true;
    try {
      final response = await ApiService.uploadAvatar(file);
      if (response != null) {
        var userData = response['user'] ?? response;
        var avatarUrl = userData['avatar'] ?? userData['image'];

        if (avatarUrl != null) {
          profileImageBase64.value = avatarUrl.toString();
          StorageService.shared.setString(
            'user_avatar_base64',
            avatarUrl.toString(),
          );
        }
        selectedImage.value = null;
        Get.snackbar("Success", "Avatar updated successfully");
        await syncWithApi();
      } else {
        Get.snackbar("Error", "Failed to update avatar");
      }
    } catch (e) {
      debugPrint("Upload error: $e");
      Get.snackbar("Error", "Failed to upload image");
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> pickImageFromGallery() async {
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (image == null) return;
    selectedImage.value = image;
    await uploadImage(File(image.path));
  }

  Future<void> takePhoto() async {
    final image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
    );
    if (image == null) return;
    selectedImage.value = image;
    await uploadImage(File(image.path));
  }

  int scanPassed(Map<String, dynamic> scan) {
    final raw =
        scan['passed_count'] ?? scan['passed'] ?? scan['pass_count'] ?? 0;
    return _toInt(raw);
  }

  int scanDefect(Map<String, dynamic> scan) {
    final raw =
        scan['defect_count'] ?? scan['defects'] ?? scan['total_defects'] ?? 0;
    return _toInt(raw);
  }

  double scanAccuracy(Map<String, dynamic> scan) {
    final raw =
        scan['accuracy_score'] ?? scan['accuracy'] ?? scan['score'] ?? 0;
    return _toDouble(raw);
  }

  String scanZone(Map<String, dynamic> scan) {
    return (scan['zone'] ?? scan['area'] ?? scan['location'] ?? 'A').toString();
  }

  String scanTitle(Map<String, dynamic> scan) {
    return (scan['title'] ?? scan['name'] ?? 'General Inspection').toString();
  }

  int _toInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }

  double _toDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  List<StatCardData> get dynamicStateCards {
    var data = scanStats.isNotEmpty ? scanStats : {};

    return [
      StatCardData(
        title: 'Passed',
        value: (data['passed_count'] ?? 0).toString(),
        trend: 'Safe',
        icondata: Icons.check_circle_outline,
        iconscolor: Colors.green,
        avatarcolor: Colors.green.shade100,
        color: const Color(0xFFE1F5EC),
      ),
      StatCardData(
        title: 'Defect',
        value: (data['defect_count'] ?? 0).toString(),
        trend: 'Warning',
        icondata: Icons.warning_amber_outlined,
        iconscolor: Colors.amber,
        avatarcolor: Colors.amber.shade200,
        color: Colors.amber.shade100,
      ),
      StatCardData(
        title: 'Accuracy',
        value: '${data['accuracy'] ?? 0}%',
        trend: '+2.3%',
        icondata: Icons.trending_up_outlined,
        iconscolor: Colors.redAccent,
        avatarcolor: Colors.redAccent.shade100,
        color: const Color(0xFFFFEBEA),
      ),
      StatCardData(
        title: 'Total Defects',
        value: (data['total_defects'] ?? 0).toString(),
        trend: 'Alert',
        icondata: Icons.bug_report_outlined,
        iconscolor: Colors.indigo,
        avatarcolor: Colors.indigo.shade100,
        color: const Color(0xFFE8EAF6),
      ),
    ];
  }

  Future<void> logout() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    try {
      await ApiService.logoutApi();
    } catch (_) {}
    await StorageService.shared.clear();
    scans.clear();
    scanStats.clear();
    selectedImage.value = null;
    profileImageBase64.value = '';
    Get.back();
    Get.offAllNamed('/loginpage');
  }
}

class StatCardData {
  final String title, value, trend;
  final IconData icondata;
  final Color iconscolor, avatarcolor, color;

  StatCardData({
    required this.title,
    required this.value,
    required this.trend,
    required this.icondata,
    required this.iconscolor,
    required this.avatarcolor,
    required this.color,
  });
}

enum UserRole { admin, user }
