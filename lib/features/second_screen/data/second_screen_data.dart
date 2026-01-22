import 'package:flutter/material.dart';
import 'package:scube_task/core/utils/icons_path.dart';

import '../model/second_screen_models.dart';

class SecondScreenData {
  SecondScreenData._();

  static PowerDonutData powerDonut() => PowerDonutData(
        value: 5.53,
        total: 8.0,
      );

  static List<PowerListItem> powerItems() => [
        PowerListItem(
          title: 'Data View',
          data1: '55505.63',
          data2: '58805.63',
          isActive: true,
          iconPath: IconsPath.dataView,
          badgeColor: const Color(0xFF4B7DFD),
        ),
        PowerListItem(
          title: 'Data Type 2',
          data1: '55505.63',
          data2: '58805.63',
          isActive: true,
          iconPath: IconsPath.data2,
          badgeColor: const Color(0xFF2EC4B6),
        ),
        PowerListItem(
          title: 'Data Type 3',
          data1: '55505.63',
          data2: '58805.63',
          isActive: false,
          iconPath: IconsPath.data3,
          badgeColor: const Color(0xFFF59E0B),
        ),
      ];

  static List<QuickActionItem> quickActions() => [
        QuickActionItem(label: 'Analysis Pro', iconPath: IconsPath.analysis),
        QuickActionItem(label: 'G. Generator', iconPath: IconsPath.generator),
        QuickActionItem(label: 'Plant Summery', iconPath: IconsPath.plantGeneration),
        QuickActionItem(label: 'Natural Gas', iconPath: IconsPath.naturalGas),
        QuickActionItem(label: 'D. Generator', iconPath: IconsPath.liveBattery),
        QuickActionItem(label: 'Water Process', iconPath: IconsPath.waterProcess),
      ];
}
