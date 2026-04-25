import 'package:defectscan/Auth/presentation/pages/password_changed.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/controller/reset_password_with_otp/reset_pass_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreenforauth extends StatelessWidget {
  final String email;
  final controller = Get.put(ResetPassOtp());

  VerifyEmailScreenforauth({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify your email address")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "We've sent a verification code to your email: \t $email\n"
              "Please enter the code below to confirm your email address.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: controller.otpControllers[index],
                    focusNode: controller.focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      controller.onChanged(index, value);
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I didn't receive a code ? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  controller.canResend.value
                      ? InkWell(
                          onTap: () {
                            controller.startTimer();
                          },
                          child: const Text(
                            "Resend",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text(
                          "Wait ${controller.seconds.value}s",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PasswordChangedPage());
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

List<String> myvalues = List.filled(4, '');
