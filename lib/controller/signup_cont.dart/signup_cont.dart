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

  GlobalKey<FormState> formState = GlobalKey();
  Future<void> registerUser() async {
    if (!(formState.currentState?.validate() ?? false)) {
      return;
    }

    try {
      await ApiService.register(
        fullName: "${firstname.text} ${lastname.text}".trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        confirmPassword: confirmpassword.text.trim(),
        phone: phone.text.trim(),
      );
      await ApiService.sendEmailCode(email.text);
      Get.toNamed('/otppage', arguments: {'email': email.text});
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool confirmpasswords() {
    if (password.text == confirmpassword.text) {
      return true;
    } else {
      return false;
    }
  }

  unlockeye() {
    locked1 = !locked1;
    update();
  }

  unlockeye2() {
    locked2 = !locked2;
    update();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();

    super.dispose();
  }
}
