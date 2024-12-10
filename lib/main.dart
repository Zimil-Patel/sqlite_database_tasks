import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/home_screen.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const HomeScreen(),

    );
  }
}
