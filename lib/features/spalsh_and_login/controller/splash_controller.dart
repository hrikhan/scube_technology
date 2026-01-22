import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import '../view/widgets/login_bottom_sheet.dart';

class SplashController extends GetxController {
  final int splashDelayMs;

  SplashController({this.splashDelayMs = 1600});

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Timer(Duration(milliseconds: splashDelayMs), _openLoginSheet);
  }

  void _openLoginSheet() {
    Get.put(LoginController());
    final context = Get.context;
    if (context == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const LoginBottomSheet(),
    );
  }
}
