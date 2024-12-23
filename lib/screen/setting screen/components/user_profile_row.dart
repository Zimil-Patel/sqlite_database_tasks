import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/screen/edit%20profile%20screen/edit_profile_screen.dart';
import 'package:sqlite_database_tasks/utils.dart';


Row userProfileRow() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // PROFILE PICTURE
      Obx(
      () =>  CircleAvatar(
          backgroundImage: userController.userList[0].profilePicture !=
              null
              ? MemoryImage(userController.userList[0].profilePicture!)
              : const AssetImage('assets/images/profile.png'),
          radius: height * 0.05,
        ),
      ),

      const SizedBox(
        width: defPadding * 2,
      ),

      // FIRST NAME AND LAST NAME
      Expanded(
        child: Obx(
  () => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userController.userList[0].firstName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: height * 0.032,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                userController.userList[0].lastName,
                style: TextStyle(
                  fontSize: height * 0.020,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),

      const SizedBox(
        width: defPadding,
      ),

      // EDIT BUTTON
      CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: (){
          userController.setUserValue(userController.userList[0]);
          Get.to(() => const EditProfileScreen());
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  size: height * 0.02,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: defPadding / 2,
                ),
                Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue
                  ),
                )
              ],
            ),
            Container(
              height: 1.5,
              width: 54,
              margin: const EdgeInsets.only(top: defPadding / 4),
              color: Colors.blue,
            ),
          ],
        ),
      ),

      const SizedBox(
        width: defPadding * 2,
      ),
    ],
  );
}