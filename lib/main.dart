import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/helper/db_helper.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DbHelper.dbHelper.deleteDatabaseFile();
  await DbHelper.dbHelper.createDatabase();
  runApp(const DBApp());
}

class DBApp extends StatelessWidget {
  const DBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
