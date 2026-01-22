import 'package:get/get.dart';

import '../data/second_screen_data.dart';
import '../model/second_screen_models.dart';

class SecondScreenController extends GetxController {
  late PowerDonutData powerData;
  List<PowerListItem> powerItems = [];
  List<QuickActionItem> quickActions = [];

  final RxInt _activeTab = 0.obs;
  final RxBool _isSource = true.obs;

  int get activeTab => _activeTab.value;
  bool get isSource => _isSource.value;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    powerData = SecondScreenData.powerDonut();
    powerItems = SecondScreenData.powerItems();
    quickActions = SecondScreenData.quickActions();
    update();
  }

  void changeTab(int index) {
    _activeTab.value = index;
    update();
  }

  void toggleSource(bool sourceSelected) {
    _isSource.value = sourceSelected;
    update();
  }
}
