import 'package:defectscan/controller/onboarding_cont/onboarding_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
   OnboardingPage({super.key});
  final OnboardingCont controller = Get.put(OnboardingCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image(
          image: AssetImage("assets/images/logol.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
