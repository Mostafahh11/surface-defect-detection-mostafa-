import 'dart:async';

import 'package:defectscan/Auth/presentation/pages/password_changed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassOtp extends GetxController {
  RxInt seconds = 20.obs;
  RxBool canResend = true.obs;
  Timer? timer;
  final otpControllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());
  String get otp =>
      otpControllers.map((controllers) => controllers.text).join();
  void onChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      } else {
        if (otp == '1234') {
          Get.dialog(
            const Center(child: CircularProgressIndicator()),
            barrierDismissible: false,
          );

          Future.delayed(const Duration(seconds: 1), () {
            Get.back();
            Get.offAll(() => PasswordChangedPage());
          });
        }
      }
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
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
