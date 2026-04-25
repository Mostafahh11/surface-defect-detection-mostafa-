import 'package:defectscan/Auth/widgets/widgets.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/core/functions/validation/validation.dart';
import 'package:defectscan/features/change_Mail_screens/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEmailScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Email")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please update the email associated with your account.",
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              controller: emailController,
              hinttext: 'Write The New Gmail',
              myicon: Icon(Icons.email),
              isvalid: (e) {
                return validinpute('email', e!, 2);
              },
              obscure: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => VerifyEmailScreen(email: emailController.text));
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
