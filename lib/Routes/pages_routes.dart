import 'package:defectscan/Auth/presentation/pages/entryscreen.dart';
import 'package:defectscan/Auth/presentation/pages/login_screen.dart';
import 'package:defectscan/Auth/presentation/pages/otp_create_account_page_1.dart';
import 'package:defectscan/Auth/presentation/pages/reset_page.dart';
import 'package:defectscan/Auth/presentation/pages/signup_page.dart';
import 'package:defectscan/Home/navigation_menu/navigation_page.dart';
import 'package:defectscan/features/onboarding_page/onboarding_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

List<GetPage<dynamic>>? routes=[
  GetPage(name: "/onboardingpage", page: ()=>OnboardingPage()),
  GetPage(name: "/loginpage", page: ()=>LoginPage()),
  GetPage(name: "/signup", page: ()=>RegisterPage()),
  GetPage(name: "/mainscaffold", page: ()=>MainScaffold()),
  GetPage(name: "/otppage", page: ()=>OtpPage()),
  GetPage(name: "/entryscreen", page: ()=>Entryscreen()),
  GetPage(name: "/forgetpassword", page: ()=>ResetPasswordPage()),
  // GetPage(name: "/onboardingpage", page: ()=>OnboardingPage()),
  
];
