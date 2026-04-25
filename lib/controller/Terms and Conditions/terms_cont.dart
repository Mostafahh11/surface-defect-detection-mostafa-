import 'package:get/get.dart';

class TermsCont extends GetxController {
  RxBool accept = false.obs;

  void acceptTerms() {
    accept.value = true;
  }
}
