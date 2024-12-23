import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/controller/filter_controller.dart';
import 'package:sqlite_database_tasks/screen/add%20screen/add_screen.dart';
import 'package:sqlite_database_tasks/utils.dart';

class CategoryExpenseListview extends StatelessWidget {
  const CategoryExpenseListview({
    super.key,
    required this.controller,
  });

  final FilterController controller;

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
        child: ListTile(
          onTap: () {
            Get.to(
                  () => const AddScreen(),
              arguments: {
                'isForEditing': true,
                'model': controller.categoryList[index],
              },
            );
          },
          leading: CircleAvatar(
            radius: height * 0.03,
            backgroundColor: iconList[controller.categoryList[index].category]
            ['color'],
            child: Icon(
              iconList[controller.categoryList[index].category]['icon'],
              size: height * 0.024,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.rotate(
                  angle: 0.8,
                  child: controller.categoryList[index].isIncome
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
            "${controller.categoryList[index].isIncome ? '+' : '-'} \$ ${controller.categoryList[index].amount.toString()}",
            style: GoogleFonts.varelaRound(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: controller.categoryList[index].isIncome
                    ? Colors.green.shade200
                    : Colors.red.shade200,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.categoryList[index].description != null
                  ? Text(
                controller.categoryList[index].description!,
                style: GoogleFonts.varelaRound(
                  textStyle: TextStyle(
                    fontSize: height * 0.015,
                    color: Colors.grey,
                  ),
                ),
              )
                  : const SizedBox(),
              Text(
                "${controller.categoryList[index].category} - ${controller.categoryList[index].date}",
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
      itemCount: controller.categoryList.length,
    );
  }
}
