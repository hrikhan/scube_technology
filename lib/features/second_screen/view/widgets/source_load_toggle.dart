import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';

class SourceLoadToggle extends StatelessWidget {
  final bool isSource;
  final VoidCallback onSource;
  final VoidCallback onLoad;

  const SourceLoadToggle({
    super.key,
    required this.isSource,
    required this.onSource,
    required this.onLoad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE9EEF5),
        borderRadius: BorderRadius.circular(29.r),
      ),
      child: Row(
        children: [
          _togglePill(label: 'Source', isSelected: isSource, onTap: onSource),
          _togglePill(label: 'Load', isSelected: !isSource, onTap: onLoad),
        ],
      ),
    );
  }

  Widget _togglePill({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0096FC) : Colors.transparent,
            borderRadius: BorderRadius.circular(29.r),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GlobalTextStyle.inter(
              color: isSelected ? Colors.white : AppColors.primaryText,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
