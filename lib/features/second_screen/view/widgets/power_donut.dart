import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/second_screen_models.dart';

class PowerDonut extends StatelessWidget {
  final PowerDonutData data;

  const PowerDonut({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final percentage = (data.value / data.total).clamp(0.0, 1.0);
    return Center(
      child: SizedBox(
        width: 170.w,
        height: 170.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 55.w,
                startDegreeOffset: -90,
                sections: [
                  PieChartSectionData(
                    value: percentage * 100,
                    color: const Color(0xFF0096FC),
                    radius: 18.w,
                    title: '',
                  ),
                  PieChartSectionData(
                    value: (1 - percentage) * 100,
                    color: const Color(0xFFE8F0FF),
                    radius: 18.w,
                    title: '',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Power',
                  style: GlobalTextStyle.inter(
                    color: AppColors.primaryText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${data.value.toStringAsFixed(2)} kw',
                  style: GlobalTextStyle.inter(
                    color: const Color(0xFF0E8CFB),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
