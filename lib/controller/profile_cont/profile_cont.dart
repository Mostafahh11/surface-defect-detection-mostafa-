import 'package:defectscan/Model/user_model.dart';
import 'package:get/get.dart';
import 'package:defectscan/Api/api.dart';
import 'package:defectscan/core/service/sharedpreff.dart';

class ProfileCont extends GetxController {
  final user = Rxn<UserModel>();
  var isSyncing = false.obs;
  var isUploading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await syncWithApi();
  }

  String get name => user.value?.fullName ?? '';
  String get email => user.value?.email ?? '';
  String get phone => user.value?.phone ?? '';
  String get profileImageUrl => user.value?.avatar ?? '';
  int get todayscans => user.value?.todayScans ?? 0;
  String get lastseen => user.value?.lastSeenAt?.toString() ?? 'N/A';
  String get roleTitle => user.value?.role == 'admin' ? "Admin" : "User";
  int get totalscans => user.value?.totalScans ?? 0;

  Future<void> syncWithApi() async {
    try {
      isSyncing.value = true;
      final freshUser = await ApiService.getMe();

      if (freshUser != null) {
        user.value = freshUser;
        await StorageService.updateUser(
          freshUser.toJson(),
        ); // 3l4an nestkhdmoh fy el cash
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong With Profile Mode $e");
    } finally {
      isSyncing.value = false;
    }
  }

  Future<void> logout() async {
    await ApiService.logoutApi();
    await StorageService.shared.clear();
    user.value = null;
    Get.offAllNamed('/loginpage');
  }
}

enum UserRole {
  admin,
  user,
  guest;

  static UserRole fromString(String? role) {
    switch (role?.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'user':
        return UserRole.user;
      default:
        return UserRole.guest;
    }
  }
}
