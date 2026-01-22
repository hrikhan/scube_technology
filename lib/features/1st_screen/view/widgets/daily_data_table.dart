import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/first_screen_models.dart';

class DailyDataTable extends StatelessWidget {
  final List<DailyDataRowModel> rows;

  const DailyDataTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '',
                  style: GlobalTextStyle.inter(
                    color: AppColors.primaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _headerCell('Yesterday\'s Data'),
              _headerCell('Today\'s Data'),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(height: 1.h),
          ...rows.asMap().entries.map(
            (entry) => _buildRow(entry.value, entry.key),
          ),
        ],
      ),
    );
  }

  Widget _headerCell(String text) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GlobalTextStyle.inter(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRow(DailyDataRowModel row, int index) {
    final bool isEven = index.isEven;
    final Color rowColor = isEven ? Colors.white : const Color(0xFFEEF3F9);

    return Container(
      color: rowColor,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                row.label,
                style: GlobalTextStyle.inter(
                  color: Colors.grey[700]!,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              row.yesterday,
              textAlign: TextAlign.center,
              style: GlobalTextStyle.inter(
                color: AppColors.primaryText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              row.today,
              textAlign: TextAlign.center,
              style: GlobalTextStyle.inter(
                color: AppColors.primaryText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
