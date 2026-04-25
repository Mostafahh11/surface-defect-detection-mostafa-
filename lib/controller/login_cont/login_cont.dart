import 'package:defectscan/Api/api.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginCont extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool locked = true;
  RxBool isLoading = true.obs;

  Future<void> goHome() async {
    if (!(formState.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    try {
      final response = await ApiService.login(
        email.text.trim(),
        password.text.trim(),
      );

      await StorageService.saveUserSession(
        token: response.token,
        user: response.user.toJson(),
      );

      Get.offAllNamed('/mainscaffold');
    } catch (error) {
      Get.snackbar(
        "ERROR",
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  unlockeye() {
    locked = !locked;
    update();
  }

  Future<void> loginWithFacebook() async {
    final result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    if (result.status == LoginStatus.success) {
      //   final accessToken = result.accessToken!.tokenString;

      //      final userData = await FacebookAuth.instance.getUserData();

      // print("TOKEN: $accessToken");
      //  print("USER DATA: $userData");
    } else {
      //print("Login failed: ${result.status}");
    }
  }
}
