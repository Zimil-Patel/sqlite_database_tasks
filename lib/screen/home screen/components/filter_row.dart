import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../home_screen.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defPadding,
        vertical: defPadding,
      ),
      child: Obx(
            () => Row(
          children: [
            Expanded(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  controller.setFilter("All");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('All', style: TextStyle(letterSpacing: 1, color: controller.filter.value == "All" ? third : Colors.white),),
                    const SizedBox(
                      height: defPadding,
                    ),
                    !(controller.filter.value == "All") ? Container(
                      height: 2,
                      color: Colors.grey,
                    ) : Container(
                      height: 2.5,
                      color: third,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  controller.setFilter("Expense");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Expense', style: TextStyle(letterSpacing: 1, color: controller.filter.value == "Expense" ? third : Colors.white),),
                    const SizedBox(
                      height: defPadding,

                    ),
                    !(controller.filter.value == "Expense") ? Container(
                      height: 2,
                      color: Colors.grey,
                    ) : Container(
                      height: 2.5,
                      color: third,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CupertinoButton(

                padding: EdgeInsets.zero,
                onPressed: (){

                  controller.setFilter("Income");

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Profit', style: TextStyle(letterSpacing: 1, color: controller.filter.value == "Income" ? third : Colors.white),),
                    const SizedBox(
                      height: defPadding,

                    ),
                    !(controller.filter.value == "Income") ? Container(
                      height: 2,
                      color: Colors.grey,
                    ) : Container(
                      height: 2.5,
                      color: third,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
