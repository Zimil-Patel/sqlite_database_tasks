import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'components/build_user_info.dart';
import 'components/user_profile_row.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: defPadding,
          horizontal: defPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PROFILE PICTURE, FIRST NAME, LAST NAME, EDIT BUTTON
            userProfileRow(),

            const SizedBox(
              height: defPadding * 2,
            ),

            Obx(
                () => Column(
                children: [
                  buildUserInfo(Icons.email, 'Email', userController.userList[0].email),
                  buildUserInfo(Icons.phone, 'Mobile number', userController.userList[0].phoneNumber),
                  buildUserInfo(Icons.person, 'Age', userController.userList[0].age.toString()),
                  buildUserInfo(Icons.face, 'Gender', userController.userList[0].gender ?? 'Not set'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
