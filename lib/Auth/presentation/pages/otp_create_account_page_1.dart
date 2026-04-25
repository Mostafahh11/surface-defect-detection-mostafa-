import 'package:defectscan/Auth/presentation/pages/account_created.dart';
import 'package:defectscan/controller/otp_create_accouny/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});
  final controller = Get.put(Otpcreateaccount());

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
                "Check your inbox! A 4-digit OTP has been sent to ${controller.email}",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
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
              Expanded(child: const SizedBox()),

              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.canResend.value
                        ? Row(
                            children: [
                              const Text(
                                "I didn't receive a code ? ",
                                style: TextStyle(fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.startTimer(); 
                                  controller.resendOtp(); 
                                },
                                child: const Text(
                                  "Resend",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              const Text(
                                "A New Code Have Sent. ",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Wait ${controller.seconds.value}s",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
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
