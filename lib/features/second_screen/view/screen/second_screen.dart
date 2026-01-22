import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common_widgets/common_app_bar.dart';
import '../../../../core/common_widgets/common_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons_path.dart';
import '../../controller/second_screen_controller.dart';
import '../widgets/power_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/second_tabs.dart';

class SecondScreen extends GetView<SecondScreenController> {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecondScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scafoldBackgroud,
          appBar: CommonAppBar(
            title: '2nd Page',
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Column(
              children: [
                CommonButton(
                  text: '1st Page Navigate',
                  onPressed: () => Get.back(),
                ),
                SizedBox(height: 14.h),
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      SecondTabs(
                        tabs: const ['Summery', 'SLD', 'Data'],
                        activeIndex: controller.activeTab,
                        onChanged: controller.changeTab,
                      ),
                      SizedBox(height: 12.h),
                      PowerCard(
                        powerData: controller.powerData,
                        isSource: controller.isSource,
                        items: controller.powerItems,
                        onSource: () => controller.toggleSource(true),
                        onLoad: () => controller.toggleSource(false),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                QuickActionsGrid(actions: controller.quickActions),
              ],
            ),
          ),
        );
      },
    );
  }
}
