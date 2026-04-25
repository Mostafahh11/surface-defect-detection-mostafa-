import 'package:defectscan/Auth/presentation/pages/reset_pasword_with_email.dart';
import 'package:defectscan/Auth/presentation/pages/signup_page.dart';
import 'package:defectscan/Auth/widgets/widgets.dart';
import 'package:defectscan/controller/login_cont/login_cont.dart';
import 'package:defectscan/core/functions/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.put(LoginCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Sign in to continue",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hinttext: "Email",
                          myicon: Icon(Icons.email),
                          controller: controller.email,
                          isvalid: (e) {
                            return validinpute('email', e!, 2);
                          },
                          obscure: false,
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => typeEmailtochangepassword());
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),

                        GetBuilder<LoginCont>(
                          builder: (_) {
                            return CustomTextFormField(
                              hinttext: "Password",
                              myicon: controller.locked
                                  ? Icon(Icons.lock, color: Colors.red)
                                  : Icon(
                                      Icons.lock_open_outlined,
                                      color: Colors.green,
                                    ),
                              onPressed: () {
                                controller.unlockeye();
                              },
                              controller: controller.password,

                              isvalid: (e) {
                                return validinpute('password', e!, 2);
                              },
                              obscure: controller.locked,
                            );
                          },
                        ),

                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0B132B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              controller.goHome();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        dividerlogin(),

                        const SizedBox(height: 20),

                        socialButton(
                          "Continue with Facebook",
                          Icons.facebook_rounded,
                          Colors.blueAccent,
                          false,
                        ),

                        const SizedBox(height: 12),

                        socialButton(
                          "Continue with Google",
                          Icons.g_mobiledata_outlined,
                          Colors.red,
                          true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(() => RegisterPage());
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
