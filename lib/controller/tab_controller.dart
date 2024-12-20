import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/screen/filter%20screen/filter_screen.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/home_screen.dart';
import 'package:sqlite_database_tasks/screen/setting%20screen/settings_screen.dart';

import '../screen/analysis screen/analysis_screen.dart';

class TabController extends GetxController {

  RxInt tabIndex = 0.obs;
  Widget tabScreen = const HomeScreen();

  setTabIndex(int index){
    tabIndex.value = index;
    switch(index){
      case 0:
        tabScreen = const HomeScreen();
        break;
      case 1:
        tabScreen = const FilterScreen();
        break;
      case 2:
        tabScreen = const SettingsScreen();
        break;
      case 3:
        tabScreen = const AnalysisScreen();
        break;
    }
  }

}