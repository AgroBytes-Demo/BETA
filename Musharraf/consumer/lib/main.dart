import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'verification_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardingPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/verification', page: () => VerificationPage()),
      ],
    );
  }
}
