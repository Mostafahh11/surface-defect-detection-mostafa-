import 'package:defectscan/Auth/presentation/pages/login_screen.dart';
import 'package:defectscan/Auth/widgets/widgets.dart';
import 'package:defectscan/controller/signup_cont.dart/signup_cont.dart';
import 'package:defectscan/core/functions/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final controller = Get.put(SignupCont());
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
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  hinttext: "First Name",
                                  myicon: Icon(Icons.person),
                                  controller: controller.firstname,
                                  isvalid: (e) {
                                    return validinpute('username', e!, 2);
                                  },
                                  obscure: false,
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
                                  obscure: false,
                                ),
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
                          obscure: false,
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        CustomTextFormField(
                          hinttext: "password",
                          myicon: Icon(Icons.remove_red_eye_outlined),
                          controller: controller.password,

                          isvalid: (e) {
                            return validinpute('password', e!, 2);
                          },
                          obscure: false,
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Confirm password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        CustomTextFormField(
                          hinttext: "confirm password",
                          myicon: Icon(Icons.remove_red_eye_outlined),
                          controller: controller.confirmpassword,

                          isvalid: (e) {
                            return validinpute('password', e!, 2);
                          },
                          obscure: false,
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: const [
                            Checkbox(value: false, onChanged: null),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Accept terms and condition ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "You agree to our Terms of Service and Privacy Policy.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                              if(controller.confirmpasswords()){
                               controller.goLogin();
                              }
                              else{

                              }
                             
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
                              color: Colors.blueAccent,
                              onTap: () {},
                            ),
                            const SizedBox(width: 16),
                            MyIconbutton(
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
                                Get.to(() => LoginPage());
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
