import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';

class SecondTabs extends StatelessWidget {
  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int> onChanged;

  const SecondTabs({
    super.key,
    required this.tabs,
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withValues(alpha: 0.1),
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isActive = activeIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF0096FC)
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(index == 0 ? 12.r : 0),
                    topRight: Radius.circular(
                      index == tabs.length - 1 ? 12.r : 0,
                    ),
                  ),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: GlobalTextStyle.inter(
                    color: isActive ? Colors.white : AppColors.primaryText,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
