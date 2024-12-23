
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../../../theme/theme_data.dart';


class GenderRadioButton extends StatelessWidget {
  const GenderRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.face, color: Colors.grey, size: height * 0.02,),
            Text(
              '  Gender',
              style: TextStyle(fontSize: height * 0.018, color: Colors.grey),
            ),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // INCOME
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    child: Obx(
                          () => Radio(
                        value: 0,
                        groupValue: userController.genderValue.value,
                        onChanged: (value) {
                          userController.setGenderValue(value!);
                        },
                        activeColor: third,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: defPadding / 2,
                  ),
                  Flexible(
                      child: Text(
                        'Male',
                        style: TextStyle(fontSize: height * 0.019),
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ),

            const SizedBox(
              width: defPadding / 2,
            ),

            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Obx(
                          () => Radio(
                        value: 1,
                        groupValue: userController.genderValue.value,
                        onChanged: (value) {
                          userController.setGenderValue(value!);

                        },
                        activeColor: third,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: defPadding / 2,
                  ),
                  Flexible(
                      child: Text('Female',
                          style: TextStyle(fontSize: height * 0.019),
                          overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),

            // EXPENSE
          ],
        )],
    );
  }
}
