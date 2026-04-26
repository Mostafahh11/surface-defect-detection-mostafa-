import 'package:defectscan/Auth/widgets/widgets.dart';
import 'package:defectscan/Terms%20and%20Conditions/Text.dart';
import 'package:defectscan/controller/Terms%20and%20Conditions/terms_cont.dart';
import 'package:defectscan/controller/signup_cont.dart/signup_cont.dart';
import 'package:defectscan/core/functions/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final controller = Get.put(SignupCont());
  final controller2 = Get.put(TermsCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formState,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Create account",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Sign up to continue",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      hinttext: "First Name",
                                      myicon: Icon(Icons.person),
                                      controller: controller.firstname,
                                      isvalid: (e) {
                                        return validinpute('username', e!, 2);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: CustomTextFormField(
                                      hinttext: "Last Name",
                                      myicon: Icon(Icons.person),
                                      controller: controller.lastname,
                                      isvalid: (e) {
                                        return validinpute('username', e!, 2);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        CustomTextFormField(
                          hinttext: "Email",
                          myicon: Icon(Icons.email),
                          controller: controller.email,
                          isvalid: (e) {
                            return validinpute('email', e!, 2);
                          },
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GetBuilder<SignupCont>(
                          builder: (_) {
                            return CustomTextFormField(
                              hinttext: "password",
                              myicon: controller.locked1
                                  ? Icon(Icons.lock, color: Colors.red)
                                  : Icon(
                                      Icons.lock_open_outlined,
                                      color: Colors.green,
                                    ),
                              controller: controller.password,
                              onPressed: () {
                                controller.unlockeye();
                              },
                              isvalid: (e) {
                                return validinpute('password', e!, 2);
                              },
                              obscure: controller.locked1,
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Confirm password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        GetBuilder<SignupCont>(
                          builder: (_) {
                            return CustomTextFormField(
                              hinttext: "confirm password",
                              myicon: controller.locked2
                                  ? Icon(Icons.lock, color: Colors.red)
                                  : Icon(
                                      Icons.lock_open_outlined,
                                      color: Colors.green,
                                    ),
                              controller: controller.confirmpassword,
                              onPressed: () {
                                controller.unlockeye2();
                              },
                              isvalid: (e) {
                                return validinpute('password', e!, 2);
                              },
                              obscure: controller.locked2,
                            );
                          },
                        ),

                        const Text(
                          "Phone",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        CustomTextFormField(
                          hinttext: "Phone",
                          myicon: Icon(Icons.phone),
                          keyboardtype: TextInputType.phone,
                          controller: controller.phone,
                          isvalid: (e) {
                            return validinpute('phone', e!, 2);
                          },
                        ),

                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller2.accept.value,
                                onChanged: (_) {
                                  if (controller2.accept.value == true) {
                                    controller2.accept.value =
                                        !controller2.accept.value;
                                  }
                                },
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Accept terms and condition",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Wrap(
                                    children: [
                                      const Text(
                                        "You agree to our ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () => showTermsDialog(context),
                                        child: const Text(
                                          "Terms of Service",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),

                                      const Text(" and "),

                                      GestureDetector(
                                        onTap: () => showTermsDialog(context),
                                        child: const Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

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
                              if (controller.confirmpasswords() &&
                                  controller2.accept.value == true) {
                                controller.registerUser();
                              } else {}
                            },
                            child: const Text(
                              "Create account",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        dividerlogin(),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIconbutton(
                              icon: Icons.facebook,
                              isgoogle: false,
                              color: Colors.blueAccent,
                              onTap: () {},
                            ),
                            const SizedBox(width: 16),
                            MyIconbutton(
                              isgoogle: true,
                              icon: Icons.g_mobiledata,
                              color: Colors.red,
                              onTap: () {},
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? "),
                            InkWell(
                              onTap: () {
                                Get.offNamed('/loginpage');
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
