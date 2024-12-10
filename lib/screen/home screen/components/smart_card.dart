import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../home_screen.dart';
import 'label_total.dart';


class SmartCard extends StatelessWidget {
  const SmartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.32,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.rotate(
            angle: -0.1,
            child: Container(
              height: height * 0.23,
              margin: const EdgeInsets.only(
                top: defPadding * 4,
                bottom: defPadding * 4.5,
                left: defPadding * 2.45,
                right: defPadding * 3.4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffc465e7),
                    Color(0xff7354fa),
                  ],
                ),
              ),
            ),
          ),

          // Blurry container
          Padding(
            padding: const EdgeInsets.only(
                top: defPadding * 5,
                left: defPadding * 2,
                right: defPadding * 2,
                bottom: defPadding * 2),
            child: BlurryContainer(
              color: Colors.white.withOpacity(0.2),
              blur: 8,
              height: height * 0.24,
              borderRadius: BorderRadius.circular(30),
              padding: EdgeInsets.zero,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(defPadding * 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My balance',
                              style: TextStyle(
                                fontSize: height * 0.018,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w100,
                              ),
                            ),

                            Obx(
                                  () => Text(
                                '\$ ${controller.balance.value}',
                                style: TextStyle(
                                  fontSize: height * 0.03,
                                  letterSpacing: 1,
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Obx(() => LabelAndTotal(label: 'Expense', total: controller.expense.value,)),
                        const Spacer(),
                        Obx(() => LabelAndTotal(label: 'Profit', total: controller.income.value,)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
