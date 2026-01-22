import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/common_app_bar.dart';
import '../../../../core/common_widgets/common_button.dart';
import '../../../../core/style/global_text_style.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons_path.dart';
import '../../../../core/routes/app_routes.dart';
import '../../controller/first_screen_controller.dart';
import '../widgets/daily_data_table.dart';
import '../widgets/info_cards_grid.dart';
import '../widgets/inverter_card.dart';
import '../widgets/summary_stats_grid.dart';
import '../widgets/weather_card.dart';

class FirstScreen extends GetView<FirstScreenController> {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstScreenController>(
      builder: (controller) {
        final weather = controller.currentWeather;
        return Scaffold(
          backgroundColor: AppColors.scafoldBackgroud,
          appBar: CommonAppBar(
            title: '1st Page',
            actions: [
              IconButton(
                onPressed: () {},
                icon: SizedBox(
                  width: 22,
                  height: 22,
                  child: Image.asset(
                    IconsPath.notification,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonButton(
                  text: '2nd Page Navigate',
                  onPressed: () => Get.toNamed(AppRoutes.secondScreen),
                ),
                SizedBox(height: 12.h),

                SummaryStatsGrid(stats: controller.metrics),
                SizedBox(height: 12.h),
                if (weather != null) ...[WeatherCard(slot: weather)],
                SizedBox(height: 12.h),
                DailyDataTable(rows: controller.dailyRows),
                SizedBox(height: 12.h),
                _totalPvModuleCard(),
                SizedBox(height: 10.h),
                InfoCardsGrid(cards: controller.infoCards),
                SizedBox(height: 14.h),

                Column(
                  children: [
                    ...controller.inverters.map(
                      (inv) => InverterCard(inverter: inv),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _totalPvModuleCard() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(),

            child: Image.asset(
              IconsPath.totalNumOfPvModule,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 12.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Num of PV Module:',
                style: GlobalTextStyle.inter(
                  color: AppColors.primaryText,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                ': 6372 pcs. (585 Wp each)',
                style: GlobalTextStyle.inter(
                  color: AppColors.primaryText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
