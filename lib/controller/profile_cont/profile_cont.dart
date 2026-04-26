import 'dart:io';
import 'package:defectscan/Api/api.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCont extends GetxController {
  // ================== بيانات المستخدم الكاملة ==================
  var id = 0.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var createdAt = ''.obs; // تم الإضافة
  var updatedAt = ''.obs; // تم الإضافة
  RxString profileImageBase64 = ''.obs;
  Rx<UserRole> userRole = UserRole.user.obs; // تم الإضافة

  final ImagePicker picker = ImagePicker();
  RxBool isUploading = false.obs;

  @override
  void onInit() {
    super.onInit();
    refreshProfile();
  }

  // تحديث بيانات البروفايل
  Future<void> refreshProfile() async {
    loadUserDataFromStorage();
    await syncWithApi();
  }

  // جلب البيانات من السيرفر وتحديث المتغيرات
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

  // معالجة وتوزيع البيانات (mapping)
  void updateInternalVariables(Map<String, dynamic> data) {
    var user = data['user'] ?? data;
    if (user is! Map<String, dynamic>) return;

    id.value = user['id'] ?? 0;
    name.value = (user['full_name'] ?? '').toString();
    email.value = (user['email'] ?? '').toString();
    phone.value = (user['phone'] ?? '').toString();
    createdAt.value = (user['created_at'] ?? '').toString(); // حفظ تاريخ الإنشاء
    updatedAt.value = (user['updated_at'] ?? '').toString(); // حفظ تاريخ التحديث

    // تحديث الصورة الشخصية
    final avatar = (user['avatar'] ?? user['image']);
    if (avatar != null && avatar.toString().isNotEmpty) {
      profileImageBase64.value = avatar.toString();
    }

    // تحديد الصلاحيات (Admin / User)
    String roleStr = user['role']?.toString().toLowerCase() ?? 'user';
    userRole.value = (roleStr == 'admin') ? UserRole.admin : UserRole.user;
  }

  // تحميل البيانات من StorageService
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

  // ================== التعامل مع الـ Avatar فقط ==================
  Future<void> uploadImage(File file) async {
    isUploading.value = true;
    try {
      final response = await ApiService.uploadAvatar(file);
      if (response != null) {
        var userData = response['user'] ?? response;
        var avatarUrl = userData['avatar'] ?? userData['image'];

        if (avatarUrl != null) {
          profileImageBase64.value = avatarUrl.toString();
          StorageService.shared.setString('user_avatar_base64', avatarUrl.toString());
        }
        Get.snackbar("نجاح", "تم تحديث الصورة الشخصية");
        await syncWithApi();
      }
    } catch (e) {
      debugPrint("Upload error: $e");
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> pickImageFromGallery() async {
    final image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) await uploadImage(File(image.path));
  }

  Future<void> takePhoto() async {
    final image = await picker.pickImage(source: ImageSource.camera, imageQuality: 60);
    if (image != null) await uploadImage(File(image.path));
  }

  // تسجيل الخروج وتنظيف البيانات
  Future<void> logout() async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    try {
      await ApiService.logoutApi();
    } catch (_) {}
    await StorageService.shared.clear();
    profileImageBase64.value = '';
    Get.back();
    Get.offAllNamed('/loginpage');
  }
  
}

enum UserRole { admin, user }