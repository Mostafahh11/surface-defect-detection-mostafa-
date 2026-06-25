// ignore_for_file: unused_local_variable

import 'package:defectscan/Api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCont extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool locked1 = true;
  bool locked2 = true;

  bool isLoading = false;

  GlobalKey<FormState> formState = GlobalKey();

  Future<void> registerUser() async {
    if (!(formState.currentState?.validate() ?? false)) {
      return;
    }

    isLoading = true;
    update();

    try {
      await ApiService.register(
        fullName: "${firstname.text} ${lastname.text}".trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        confirmPassword: confirmpassword.text.trim(),
        phone: phone.text.trim(),
      );

      await ApiService.sendEmailCode(email.text);

      Get.offNamed('/otppage', arguments: {'email': email.text});
    } catch (e) {
      String cleanMessage = e.toString().replaceAll('Exception: ', '').trim();
      Get.snackbar(
        "Error",
        cleanMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  bool confirmpasswords() => password.text == confirmpassword.text;

  void unlockeye() {
    locked1 = !locked1;
    update();
  }

  void unlockeye2() {
    locked2 = !locked2;
    update();
  }

  @override
  void onClose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    phone.dispose(); 
    super.onClose();
  }
}
