import 'package:flutter/material.dart';

class PowerDonutData {
  final double value;
  final double total;

  PowerDonutData({
    required this.value,
    required this.total,
  });
}

class PowerListItem {
  final String title;
  final String data1;
  final String data2;
  final bool isActive;
  final String iconPath;
  final Color badgeColor;

  PowerListItem({
    required this.title,
    required this.data1,
    required this.data2,
    required this.isActive,
    required this.iconPath,
    required this.badgeColor,
  });
}

class QuickActionItem {
  final String label;
  final String iconPath;

  QuickActionItem({
    required this.label,
    required this.iconPath,
  });
}
