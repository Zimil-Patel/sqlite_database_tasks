import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';
import 'package:sqlite_database_tasks/screen/register%20screen/register_screen.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'controller/tab_controller.dart';

late HomeController controller;
late TabsController tabController;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  controller = Get.put(HomeController());
  tabController = Get.put(TabsController());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Transparent status bar
    // statusBarIconBrightness: Brightness.dark, // Icon brightness
    // systemNavigationBarColor: Colors.transparent, // Transparent navigation bar
    // systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const DBApp());
}

class DBApp extends StatelessWidget {
  const DBApp({super.key});

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),

    );
  }
}
