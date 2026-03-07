import 'package:defectscan/Auth/presentation/pages/account_created.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Enter Verfication Code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Check your inbox! A 6-digit OTP has been sent to mostafa.",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),

              const SizedBox(height: 20),

              // 👇 Row المربعات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        // controller.updateOtp(index, value);
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        } else if (index == 5) {}
                      },
                      decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                }),
              ),
              Expanded(child: const SizedBox()),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I didn't receive a code ? ",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
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
                    Get.to(() => AccountCreatedPage());
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget sendagain(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Send code Again  ",
        style: TextStyle(fontSize: 15, color: Colors.black54),
      ),
      Text("00:$text", style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}
