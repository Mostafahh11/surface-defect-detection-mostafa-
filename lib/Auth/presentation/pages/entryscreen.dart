import 'package:defectscan/Auth/presentation/pages/login_screen.dart';
import 'package:defectscan/Auth/presentation/pages/signup_page.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Entryscreen extends StatelessWidget {
  const Entryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Image(
                    image: AssetImage("assets/images/logos.png"),
                    fit: BoxFit.cover,
                  ),
                ),

                Text(
                  "STEEL SCAN",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Now Your finances are in one Place\n and Always under Control",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                SizedBox(height: 70),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(() => LoginPage());
                    },
                    color: Mycolors.org,
                    child: Text(
                      "sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(() => RegisterPage());
                    },

                    child: Text("Create Account"),
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
