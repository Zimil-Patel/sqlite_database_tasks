import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../../main.dart';
import 'components/expense_list_view.dart';
import 'components/filter_row.dart';
import 'components/search_button.dart';
import 'components/smart_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defPadding),
                  child: Obx(
                    () => CircleAvatar(
                      radius: height * 0.027,
                      backgroundImage:
                          userController.userList[0].profilePicture != null
                              ? MemoryImage(
                                  userController.userList[0].profilePicture!)
                              : const AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    "${userController.userList[0].firstName} ${userController.userList[0].lastName} ",
                    style: GoogleFonts.varelaRound(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const SearchButton(),
              ],
            ),

            // CARD - BALANCE, EXPENSE, INCOME
            const SmartCard(),

            // ALL - EXPENSE - INCOME
            const FilterRow(),

            // TRANSACTIONS
            Obx(
              () => controller.expenseList.isNotEmpty
                  ? ExpenseListView(controller: controller)
                  : Center(
                      child: Text(
                        'No transaction found!',
                        style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),

            const SizedBox(
              height: defPadding * 10,
            ),
          ],
        ),
      ),
    );
  }
}
