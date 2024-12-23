import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';
import 'package:sqlite_database_tasks/screen/add%20screen/add_screen.dart';
import 'package:sqlite_database_tasks/utils.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      itemBuilder: (context, index) => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: Hero(
          tag: 'addScreen',
          child: ListTile(
            onTap: () {
              Get.to(
                () => const AddScreen(),
                arguments: {
                  'isForEditing': true,
                  'model': controller.expenseList[index],
                },
              );
            },
            leading: CircleAvatar(
              radius: height * 0.03,
              backgroundColor: iconList[controller.expenseList[index].category]
                  ['color'],
              child: Icon(
                iconList[controller.expenseList[index].category]['icon'],
                size: height * 0.024,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(
                    angle: 0.8,
                    child: controller.expenseList[index].isIncome
                        ? Icon(
                            Icons.arrow_downward_rounded,
                            size: height * 0.028,
                            color: Colors.green.shade300,
                          )
                        : Icon(
                            Icons.arrow_upward_rounded,
                            size: height * 0.028,
                            color: Colors.red.shade300,
                          )),
              ],
            ),
            title: Text(
              "${controller.expenseList[index].isIncome ? '+' : '-'} \$ ${controller.expenseList[index].amount.toString()}",
              style: GoogleFonts.varelaRound(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.expenseList[index].isIncome
                      ? Colors.green.shade200
                      : Colors.red.shade200,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.expenseList[index].description != null
                    ? Text(
                        controller.expenseList[index].description!,
                        style: GoogleFonts.varelaRound(
                          textStyle: TextStyle(
                            fontSize: height * 0.015,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : const SizedBox(),
                Text(
                  "${controller.expenseList[index].category} - ${controller.expenseList[index].date}",
                  style: GoogleFonts.varelaRound(
                    textStyle: TextStyle(
                      fontSize: height * 0.015,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      itemCount: controller.expenseList.length,
    );
  }
}
