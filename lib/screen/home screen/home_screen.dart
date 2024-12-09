import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('DB CRUD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(

              child: Container(
                padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(2, 2),
                        color: Colors.black38,
                      ),
                    ],
                  ),
                  child: const Text('Press here to add db record...', style: TextStyle(color: Colors.white),)),
              onPressed: () {
                final currentDate = DateTime.now();
                final date = '${currentDate.day}/${currentDate.month}/${currentDate.year}';
                controller.insertIntoDatabase(amt: 699.83, category: 'Zoya-Fuel', isIncome: 0, date: date);
              },
            ),
          ],
        ),
      ),
    );
  }
}
