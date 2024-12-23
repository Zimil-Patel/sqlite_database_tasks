import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/model/user_model.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

Center saveButton() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(defPadding * 2),
      child: CupertinoButton(
        onPressed: () async {



          UserModel model = UserModel.fromDb(
            {
              'id' : userController.userList[0].id,
              'firstName' : userController.txtFirstName.text,
              'lastName' : userController.txtLastName.text,
              'email' : userController.txtEmail.text,
              'phoneNumber' : userController.txtPhone.text,
              'password' : userController.userList[0].password,
              'age' : userController.txtAge.text != 'Not set' ? int.parse(userController.txtAge.text.toString()) : null,
              'gender' : userController.genderValue.value == 0 ? 'Male' : 'Female',
              'profilePicture' : userController.image,
            },
          );

          await userController.updateRecord(model);
          userController.clearController();
          Get.back();
        },
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defPadding * 3, vertical: defPadding * 1.2),
          decoration: BoxDecoration(
            color: third,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: height * 0.02,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
