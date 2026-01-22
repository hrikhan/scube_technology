import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/first_screen_models.dart';

class WeatherTimeline extends StatelessWidget {
  final List<WeatherSlot> slots;

  const WeatherTimeline({super.key, required this.slots});

  @override
  Widget build(BuildContext context) {
    return Column(children: [...slots.map((slot) => _WeatherItem(slot: slot))]);
  }
}

class _WeatherItem extends StatelessWidget {
  final WeatherSlot slot;

  const _WeatherItem({required this.slot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(colors: slot.gradient),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _temperatureColumn(),
                  SizedBox(width: 12.w),
                  _windColumn(),
                  const Spacer(),
                  SizedBox(
                    width: 32.w,
                    height: 32.w,
                    child: Image.asset(slot.iconPath, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            slot.timeRange,
            style: GlobalTextStyle.inter(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _temperatureColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          slot.temperature,
          style: GlobalTextStyle.inter(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          'Module\nTemperature',
          style: GlobalTextStyle.inter(
            color: Colors.white70,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            lineHeight: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _windColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          slot.wind,
          style: GlobalTextStyle.inter(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          slot.irradiation,
          style: GlobalTextStyle.inter(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'Effective Irradiation',
          style: GlobalTextStyle.inter(
            color: Colors.white70,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
