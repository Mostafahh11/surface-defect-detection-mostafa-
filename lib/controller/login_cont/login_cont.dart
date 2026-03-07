import 'package:defectscan/Model/user_model.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCont extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final List<User> users = [
    User(
      id: 0,
      firstname: 'mostafa',
      secoundname: 'hassan',
      email: 'mostafahassan@gmail.com',
      password: "1234",
      phone: '01008838220',
    ),
  ];

  void goHome() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formState.currentState?.validate() ?? false) {
      User? foundUser = users.firstWhereOrNull(
        (user) =>
            user.email == email.text.trim() &&
            user.password == password.text.trim(),
      );

      if (foundUser != null) {
        StorageService.saveUserLogin(
          userid: foundUser.id,
          firstname: foundUser.firstname,
          secoundname: foundUser.secoundname,
          useremail: foundUser.email,
          userpassword: foundUser.password,
        );
        Future.delayed(Duration(milliseconds: 200), () {
          Get.offAllNamed('/mainscaffold');
        });
      } else {
        Get.snackbar(
          "Invalid Login",
          "Email or Password is wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
