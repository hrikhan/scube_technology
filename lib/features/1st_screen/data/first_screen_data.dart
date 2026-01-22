import 'package:flutter/material.dart';
import 'package:scube_task/core/utils/icons_path.dart';

import '../model/first_screen_models.dart';

class FirstScreenData {
  static List<MetricStat> metrics() => [
    MetricStat(
      label: 'Live AC Power',
      value: '10000 kW',
      subtitle: 'AC Power',
      color: Colors.green,
      iconPath: IconsPath.liveacPowr,
    ),
    MetricStat(
      label: 'Plant Generation',
      value: '82.58 %',
      subtitle: 'Plant Generation',
      color: Colors.blue,
      iconPath: IconsPath.plantGeneration,
    ),
    MetricStat(
      label: 'Live PR',
      value: '85.61 %',
      subtitle: 'Performance',
      color: Colors.orange,
      iconPath: IconsPath.livePr,
    ),
    MetricStat(
      label: 'Cumulative PR',
      value: '27.58 %',
      subtitle: 'Performance',
      color: Colors.teal,
      iconPath: IconsPath.cumulativePr,
    ),
    MetricStat(
      label: 'Return PV (Year)',
      value: '10000 T',
      subtitle: 'Return PV (Year)',
      color: Colors.purple,
      iconPath: IconsPath.returnPvTillToday,
    ),
    MetricStat(
      label: 'Total Energy',
      value: '10000 kWh',
      subtitle: 'Total Energy',
      color: Colors.deepOrange,
      iconPath: IconsPath.totalEnergy,
    ),
  ];

  static List<WeatherSlot> weatherSlots() => [
    WeatherSlot(
      temperature: '17',
      temperatureValue: 17,
      wind: '26 MPH / NW',
      irradiation: '15.20 w/m',
      irradiationValue: 15.2,
      timeRange: '11:00 am - 12:00 pm',
      iconPath: IconsPath.morning,
      gradient: [Colors.blue.shade50, Colors.blue.shade200],
    ),
    WeatherSlot(
      temperature: '30',
      temperatureValue: 30,
      wind: '28 MPH / NW',
      irradiation: '15.20 w/m',
      irradiationValue: 15.2,
      timeRange: '12:00 pm - 01:00 pm',
      iconPath: IconsPath.noon,
      gradient: [Colors.purple.shade100, Colors.purple.shade300],
    ),
    WeatherSlot(
      temperature: '19',
      temperatureValue: 19,
      wind: '26 MPH / NW',
      irradiation: '15.20 w/m�',
      irradiationValue: 15.2,
      timeRange: '02:30 pm - 03:30 pm',
      iconPath: IconsPath.afternoon,
      gradient: [Colors.deepPurple.shade100, Colors.deepPurple.shade300],
    ),
  ];

  static List<DailyDataRowModel> dailyRows() => [
    DailyDataRowModel(
      label: 'AC Max Power',
      yesterday: '1636.50 kW',
      today: '2121.88 kW',
    ),
    DailyDataRowModel(
      label: 'Net Energy',
      yesterday: '6439.16 kWh',
      today: '4875.77 kWh',
    ),
    DailyDataRowModel(
      label: 'Specific Yield',
      yesterday: '1.25 kWh/kWp',
      today: '0.94 kWh/kWp',
    ),
    DailyDataRowModel(
      label: 'Net Energy',
      yesterday: '6439.16 kWh',
      today: '4875.77 kWh',
    ),
    DailyDataRowModel(
      label: 'Specific Yield',
      yesterday: '1.25 kWh/kWp',
      today: '0.94 kWh/kWp',
    ),
  ];

  static List<InfoCardModel> infoCards() => [
    InfoCardModel(
      label: 'Total AC Capacity',
      value: '3000 kW',
      iconPath: IconsPath.totalAcCapacity,
    ),
    InfoCardModel(
      label: 'Total DC Capacity',
      value: '3.727 MWp',
      iconPath: IconsPath.totalDcCapacity,
    ),
    InfoCardModel(
      label: 'Date of Commissioning',
      value: '17/07/2024',
      iconPath: IconsPath.dateOfCommissioning,
    ),
    InfoCardModel(
      label: 'Number of Inverter',
      value: '30',
      iconPath: IconsPath.numberOfInverter,
    ),
    InfoCardModel(
      label: 'Total AC Capacity',
      value: '3000 kW',
      iconPath: IconsPath.totalAcCapacity,
    ),
    InfoCardModel(
      label: 'Total DC Capacity',
      value: '3.727 MWp',
      iconPath: IconsPath.totalDcCapacity,
    ),
  ];

  static List<InverterModel> inverterList() => [
    InverterModel(
      name: 'LT_01',
      lifetimeEnergy: '352.96 MWh',
      todayEnergy: '273.62 kWh',
      returnPv: '0.00 MWh',
      totalEnergy: '495.505 kWp / 440 kW',
      color: Colors.blue.shade50,
      lifetimeIconPath: IconsPath.lifeTimeEnergy,
      todayIconPath: IconsPath.analysis,
      returnIconPath: IconsPath.returnPvTillToday,
      totalIconPath: IconsPath.lt1TotalEnergy,
    ),
    InverterModel(
      name: 'LT_02',
      lifetimeEnergy: '352.96 MWh',
      todayEnergy: '273.62 kWh',
      returnPv: '0.00 MWh',
      totalEnergy: '495.505 kWp / 440 kW',
      color: Colors.blue.shade50,
      lifetimeIconPath: IconsPath.lifeTimeEnergy,
      todayIconPath: IconsPath.analysis,
      returnIconPath: IconsPath.returnPvTillToday,
      totalIconPath: IconsPath.lt1TotalEnergy,
    ),
  ];
}
