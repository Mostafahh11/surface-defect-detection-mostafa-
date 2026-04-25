import 'package:defectscan/Auth/widgets/widgets.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/Resest_password_with_Email/reset_password_with_email.dart';
import 'package:defectscan/core/functions/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class typeEmailtochangepassword extends StatelessWidget {
  final controller = Get.put(ResetPasswordWithEmail());

  typeEmailtochangepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please Type the Email associated with your account.",
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
            SizedBox(height: 20),
            Form(
              key: controller.formstate,
              child: CustomTextFormField(
                controller: controller.email,
                hinttext: 'Please Type Your Email ',
                myicon: Icon(Icons.email),
                isvalid: (e) {
                  return validinpute('email', e!, 2);
                },
                obscure: false,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.writegmail();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.org,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
