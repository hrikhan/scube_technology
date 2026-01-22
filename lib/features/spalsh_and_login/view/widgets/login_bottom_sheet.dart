import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/common_button.dart';
import '../../../../core/custom_widgets/textfeild_custom.dart';
import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../controller/login_controller.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        final viewInsets = MediaQuery.of(context).viewInsets.bottom;
        final maxHeight = MediaQuery.of(context).size.height * 0.7;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: viewInsets),
          child: SafeArea(
            top: false,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: Material(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 16.h,
                    bottom: 16.h,
                  ),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GlobalTextStyle.inter(
                            color: AppColors.primaryText,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hintText: 'Username',
                          controller: controller.usernameController,
                        ),
                        SizedBox(height: 12.h),
                        CustomTextField(
                          hintText: 'Password',
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordObscured.value,
                          suffixIcon: Icon(
                            controller.isPasswordObscured.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: Colors.grey.shade700,
                          ),
                          onSuffixTap: controller.togglePasswordVisibility,
                        ),
                        16.verticalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forget password?',
                              style: GlobalTextStyle.inter(
                                color: const Color(0xFF9E9E9E),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        16.verticalSpace,
                        CommonButton(
                          text: 'Login',
                          onPressed: controller.submitLogin,
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have any account?",
                              style: GlobalTextStyle.inter(
                                color: const Color(0xFF9E9E9E),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Register Now',
                                style: GlobalTextStyle.inter(
                                  color: AppColors.primary,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        80.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
