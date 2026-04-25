import 'package:defectscan/Auth/presentation/pages/verify_otp_to_change_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordWithEmail extends GetxController {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  writegmail() {
    if (formstate.currentState!.validate()) {
      Get.to(() => VerifyEmailScreenforauth(email: email.text));
    }
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
