import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/second_screen_models.dart';
import 'power_donut.dart';
import 'power_list_item_tile.dart';
import 'source_load_toggle.dart';

class PowerCard extends StatelessWidget {
  final PowerDonutData powerData;
  final bool isSource;
  final List<PowerListItem> items;
  final VoidCallback onSource;
  final VoidCallback onLoad;

  const PowerCard({
    super.key,
    required this.powerData,
    required this.isSource,
    required this.items,
    required this.onSource,
    required this.onLoad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Electricity',
            style: GlobalTextStyle.inter(
              color: AppColors.secondaryText,
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Divider(color: Colors.black.withValues(alpha: 0.4), thickness: 1.w),
          PowerDonut(data: powerData),
          SizedBox(height: 12.h),
          SourceLoadToggle(
            isSource: isSource,
            onSource: onSource,
            onLoad: onLoad,
          ),
          SizedBox(height: 12.h),
          ...items.map((item) => PowerListItemTile(item: item)),
        ],
      ),
    );
  }
}
