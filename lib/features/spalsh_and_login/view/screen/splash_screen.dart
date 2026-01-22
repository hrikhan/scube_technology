import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons_path.dart';
import '../../../../core/style/global_text_style.dart';
import '../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.verticalSpace,
              Image.asset(IconsPath.splashIcon, width: 96.w, height: 98.w),
              const SizedBox(height: 20),
              Text(
                'SCUBE',
                style: GlobalTextStyle.inter(
                  color: AppColors.textWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Control & Monitoring System',
                style: GlobalTextStyle.inter(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
