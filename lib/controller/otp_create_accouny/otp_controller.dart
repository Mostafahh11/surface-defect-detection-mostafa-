import 'dart:async';

import 'package:defectscan/Api/api.dart';
import 'package:defectscan/Auth/presentation/pages/account_created.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Otpcreateaccount extends GetxController {
  RxInt seconds = 20.obs;
  RxBool canResend = true.obs;
  String email = '';
  Timer? timer;
  final otpControllers = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());
  String get otp =>
      otpControllers.map((controllers) => controllers.text).join();

  void onChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 5) {
        focusNodes[index + 1].requestFocus();
      } else {
        handleEmailVerification();
      }
    }
  }

  void handleEmailVerification() async {
    // إظهار اللودينج
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    bool success = await ApiService.verifyEmailOTP(email, otp);

    Get.back();

    if (success) {
      Get.offAll(() => AccountCreatedPage());
    } else {
      Get.snackbar("خطأ", "كود التفعيل غير صحيح");

      for (var c in otpControllers) {
        c.clear();
      }

      focusNodes[0].requestFocus();
    }
  }
void resendOtp() async {
 await ApiService.resendCode(email);
}

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      email = Get.arguments['email'];
    }
  }

  @override
  void onClose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
    timer?.cancel();
  }

  void startTimer() {
    canResend.value = false;
    seconds.value = 20;

    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 1) {
        seconds.value--;
      } else {
        timer.cancel();
        canResend.value = true;
      }
    });
  }
}
