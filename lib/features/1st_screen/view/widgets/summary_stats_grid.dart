import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/first_screen_models.dart';

class SummaryStatsGrid extends StatelessWidget {
  final List<MetricStat> stats;

  const SummaryStatsGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - (2 * 10.w)) / 3;

        return Wrap(
          spacing: 8.w,
          runSpacing: 8.w,
          children: stats.map((stat) {
            return SizedBox(
              width: itemWidth,
              child: Container(
                padding: EdgeInsets.only(
                  left: 4.w,
                  right: 6.w,
                  top: 6.h,
                  bottom: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      stat.iconPath,
                      fit: BoxFit.contain,
                      height: 22.w,
                      width: 22.w,
                    ),
                    1.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stat.value,
                          style: GlobalTextStyle.inter(
                            color: AppColors.primaryText,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                        ),
                        2.verticalSpace,
                        Text(
                          stat.label,
                          style: GlobalTextStyle.inter(
                            color: Colors.grey[600]!,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
