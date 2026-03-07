import 'package:defectscan/Auth/presentation/pages/entryscreen.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:get/get.dart';

class OnboardingCont extends GetxController {
  void gotoentry() {
    Future.delayed(Duration(seconds: 3), () {
      StorageService.isLogin()?
      Get.offAllNamed('mainscaffold'):
      Get.offAll(() => Entryscreen());
    });
  }

  @override
  void onInit() {
    gotoentry();
    super.onInit();
  }
}
