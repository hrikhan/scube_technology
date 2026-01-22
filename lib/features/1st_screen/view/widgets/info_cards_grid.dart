import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../model/first_screen_models.dart';

class InfoCardsGrid extends StatelessWidget {
  final List<InfoCardModel> cards;

  const InfoCardsGrid({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.w,
        crossAxisSpacing: 8.w,
        childAspectRatio: 3,
      ),
      itemCount: cards.length,
      itemBuilder: (_, index) {
        final card = cards[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.w,

                child: Image.asset(card.iconPath, fit: BoxFit.contain),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      card.label,
                      style: GlobalTextStyle.inter(
                        color: Colors.grey[700]!,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.2,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      card.value,
                      style: GlobalTextStyle.inter(
                        color: AppColors.primaryText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
