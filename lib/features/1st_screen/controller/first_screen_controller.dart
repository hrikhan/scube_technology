import 'dart:async';

import 'package:get/get.dart';
import 'package:scube_task/features/1st_screen/data/first_screen_data.dart';

import '../model/first_screen_models.dart';

class FirstScreenController extends GetxController {
  List<MetricStat> metrics = [];
  List<WeatherSlot> weatherSlots = [];
  List<DailyDataRowModel> dailyRows = [];
  List<InfoCardModel> infoCards = [];
  List<InverterModel> inverters = [];

  final RxInt _currentWeatherIndex = 0.obs;
  Timer? _weatherTimer;

  WeatherSlot? get currentWeather => weatherSlots.isEmpty
      ? null
      : weatherSlots[_currentWeatherIndex.value % weatherSlots.length];

  @override
  void onInit() {
    super.onInit();
    _loadData();
    _startWeatherCycle();
  }

  @override
  void onClose() {
    _weatherTimer?.cancel();
    super.onClose();
  }

  void _loadData() {
    metrics = FirstScreenData.metrics();
    weatherSlots = FirstScreenData.weatherSlots();
    dailyRows = FirstScreenData.dailyRows();
    infoCards = FirstScreenData.infoCards();
    inverters = FirstScreenData.inverterList();
    update();
  }

  void _startWeatherCycle() {
    _weatherTimer?.cancel();
    if (weatherSlots.isEmpty) return;
    _weatherTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      _currentWeatherIndex.value =
          (_currentWeatherIndex.value + 1) % weatherSlots.length;
      update();
    });
  }
}
