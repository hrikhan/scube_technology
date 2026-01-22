import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/global_text_style.dart';
import '../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GlobalTextStyle.inter(
          color: const Color(0xFF9E9E9E),
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onSuffixTap,
                child: suffixIcon,
              )
            : null,
      ),
    );
  }
}
