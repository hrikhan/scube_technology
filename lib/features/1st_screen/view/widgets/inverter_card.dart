import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/core/utils/icons_path.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/first_screen_models.dart';

class InverterCard extends StatelessWidget {
  final InverterModel inverter;

  const InverterCard({super.key, required this.inverter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE5EEFF), width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerRow(),
          SizedBox(height: 8.h),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metric(
                      label: 'Lifetime Energy',
                      value: inverter.lifetimeEnergy,
                      iconPath: inverter.lifetimeIconPath,
                    ),
                    SizedBox(height: 10.h),
                    _metric(
                      label: 'Prev. Meter Energy',
                      value: inverter.returnPv,
                      iconPath: "assets/pre_mete_eng.png",
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metric(
                      label: 'Today Energy',
                      value: inverter.todayEnergy,
                      iconPath: "assets/today_enargy.png",
                    ),
                    SizedBox(height: 10.h),
                    _metric(
                      label: 'Live Power',
                      value: "550 kW",
                      iconPath: IconsPath.livePower,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            inverter.name,
            style: GlobalTextStyle.inter(
              color: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        SizedBox(width: 10.w),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 18.w,
              height: 18.w,
              child: Image.asset(inverter.totalIconPath, fit: BoxFit.contain),
            ),
            SizedBox(width: 6.w),
            Text(
              inverter.totalEnergy,
              style: GlobalTextStyle.inter(
                color: const Color(0xFF2B6BE6),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _metric({
    required String label,
    required String value,
    required String iconPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
            SizedBox(width: 6.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GlobalTextStyle.inter(
                    color: Colors.blueGrey.shade700,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: GlobalTextStyle.inter(
                    color: AppColors.primaryText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
