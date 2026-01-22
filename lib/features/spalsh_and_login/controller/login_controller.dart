import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordObscured = true.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordObscured.toggle();
    update();
  }

  void submitLogin() {
    // In a real flow you'd validate and authenticate before navigation.
    Get.back(); // close bottom sheet
    Get.offAllNamed(AppRoutes.firstScreen);
  }
}
