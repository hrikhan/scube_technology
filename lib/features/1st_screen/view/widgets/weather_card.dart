import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/core/utils/colors.dart';

import '../../../../core/style/global_text_style.dart';
import '../../model/first_screen_models.dart';

class WeatherCard extends StatelessWidget {
  final WeatherSlot slot;

  const WeatherCard({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    final primaryGradient = const [Color(0xFF2E63F7), Color(0xFFB982D9)];

    return Container(
      // padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(colors: primaryGradient),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: _temperatureColumn(),
          ),
          SizedBox(width: 12.w),
          _windColumn(),

          SizedBox(
            width: 48.w,
            height: 48.w,
            child: Image.asset(slot.iconPath, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }

  Widget _temperatureColumn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${slot.temperature}\u00B0C',
              style: GlobalTextStyle.inter(
                color: AppColors.primary,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            14.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Module',
                  style: GlobalTextStyle.inter(
                    color: AppColors.secondaryText,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Temperature',
                  style: GlobalTextStyle.inter(
                    color: AppColors.secondaryText,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(width: 12.w),
        _thermometer(
          temperature: slot.temperatureValue,
          assets: const [
            'assets/17_degrre.png',
            'assets/19 degree_themometer.png',
            'assets/30_degreggree_thermometer.png',
          ],
        ),
      ],
    );
  }

  Widget _thermometer({
    required double temperature,
    required List<String> assets,
  }) {
    final activeIndex = _activeThermometerIndex(temperature);
    final activeAsset = assets[activeIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: Container(
        key: ValueKey(activeAsset),
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Image.asset(activeAsset, width: 33.w, fit: BoxFit.contain),
      ),
    );
  }

  int _activeThermometerIndex(double temperature) {
    if (temperature < 18) return 0;
    if (temperature < 25) return 1;
    return 2;
  }

  Widget _windColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              slot.wind,
              style: GlobalTextStyle.inter(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Wind Speed & Direction",
              style: GlobalTextStyle.inter(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 2.h,
            width: 10.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                colors: [Color(0xffC2CEFF), Color(0xff728DF8)],
              ),
            ),
          ),
        ),
        8.verticalSpace,
        Text(
          '${slot.irradiation}',
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
