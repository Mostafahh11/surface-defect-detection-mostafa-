import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordCont extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void dispose() {
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }
}
