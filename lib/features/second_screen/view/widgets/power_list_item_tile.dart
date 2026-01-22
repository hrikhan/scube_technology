import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/second_screen_models.dart';

class PowerListItemTile extends StatelessWidget {
  final PowerListItem item;

  const PowerListItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFECF4FF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: item.isActive ? const Color(0xFF8DB7FF) : const Color(0xFFFFA78F),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: Image.asset(item.iconPath, fit: BoxFit.contain),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: GlobalTextStyle.inter(
                              color: AppColors.primaryText,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        _statusBadge(
                          isActive: item.isActive,
                          color: item.badgeColor,
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    _dataRow('Data 1', item.data1),
                    SizedBox(height: 4.h),
                    _dataRow('Data 2', item.data2),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusBadge({required bool isActive, required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        isActive ? 'Active' : 'Inactive',
        style: GlobalTextStyle.inter(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _dataRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label :',
          style: GlobalTextStyle.inter(
            color: Colors.blueGrey.shade600,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          value,
          style: GlobalTextStyle.inter(
            color: AppColors.primaryText,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
