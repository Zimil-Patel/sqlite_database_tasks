import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../../../main.dart';
import 'label_total.dart';

class SmartCard extends StatelessWidget {
  const SmartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.26,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.rotate(
            angle: -0.1,
            child: Container(
              margin: const EdgeInsets.only(
                top: defPadding * 2.5,
                bottom: defPadding * 2.8,
                left: defPadding * 2.6,
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
              top: defPadding * 3.4,
              left: defPadding * 2,
              right: defPadding * 2,
              bottom: defPadding * 0.5,
            ),
            child: BlurryContainer(
              color: Colors.white.withOpacity(0.18),
              blur: 4,
              height: height * 0.24,
              borderRadius: BorderRadius.circular(30),
              padding: EdgeInsets.zero,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:  defPadding * 2, vertical: defPadding * 1.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My balance',
                              style: GoogleFonts.varelaRound(
                                fontSize: height * 0.018,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Obx(
                                  () => Text(
                                '\$ ${controller.balance.value}',
                                style: GoogleFonts.varelaRound(
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
                        Obx(() => LabelAndTotal(
                          label: 'Expense',
                          total: controller.expense.value,
                        )),
                        const Spacer(),
                        Obx(() => LabelAndTotal(
                          label: 'Profit',
                          total: controller.income.value,
                        )),
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
