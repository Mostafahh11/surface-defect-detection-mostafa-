
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCont extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  goLogin() {
    if (formState.currentState!.validate()) {
      Get.offAllNamed('/otppage');
    } else {
      GetSnackBar(title: "Invalid", backgroundColor: Colors.red);
    }
  }

  bool confirmpasswords() {
    if (password.text == confirmpassword.text) {
      return true;
    } else {
      return false;
    }
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
