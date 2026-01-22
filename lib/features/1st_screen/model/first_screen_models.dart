import 'package:flutter/material.dart';

class MetricStat {
  final String label;
  final String value;
  final String subtitle;
  final Color color;
  final String iconPath;

  MetricStat({
    required this.label,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.iconPath,
  });
}

class WeatherSlot {
  final String temperature;
  final double temperatureValue;
  final String wind;
  final String irradiation;
  final double irradiationValue;
  final String timeRange;
  final String iconPath;
  final List<Color> gradient;

  WeatherSlot({
    required this.temperature,
    required this.temperatureValue,
    required this.wind,
    required this.irradiation,
    required this.irradiationValue,
    required this.timeRange,
    required this.iconPath,
    required this.gradient,
  });
}

class DailyDataRowModel {
  final String label;
  final String yesterday;
  final String today;

  DailyDataRowModel({
    required this.label,
    required this.yesterday,
    required this.today,
  });
}

class InfoCardModel {
  final String label;
  final String value;
  final String iconPath;

  InfoCardModel({
    required this.label,
    required this.value,
    required this.iconPath,
  });
}

class InverterModel {
  final String name;
  final String lifetimeEnergy;
  final String todayEnergy;
  final String returnPv;
  final String totalEnergy;
  final Color color;
  final String lifetimeIconPath;
  final String todayIconPath;
  final String returnIconPath;
  final String totalIconPath;

  InverterModel({
    required this.name,
    required this.lifetimeEnergy,
    required this.todayEnergy,
    required this.returnPv,
    required this.totalEnergy,
    required this.color,
    required this.lifetimeIconPath,
    required this.todayIconPath,
    required this.returnIconPath,
    required this.totalIconPath,
  });
}
