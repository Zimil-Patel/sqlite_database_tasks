import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/model/user_model.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/home_screen.dart';
import 'package:sqlite_database_tasks/screen/tab%20screen/tab_screen.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';


SizedBox signUpButton(BuildContext context) {
  return SizedBox(
    height: height * 0.054,
    child: CupertinoButton(
      borderRadius: BorderRadius.circular(14),
      padding: EdgeInsets.zero,
      color: third,
      onPressed: () async {
        final map = {
          'firstName': userController.txtFirstName.text,
          'lastName' : userController.txtLastName.text,
          'email' : userController.txtEmail.text,
          'password' : userController.txtPassword.text,
          'phoneNumber' : userController.txtPhone.text,
        };

        UserModel userModel = UserModel.fromDb(map);

        int result = await userController.insertRecord(userModel);

        if (result == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registered successfully'),
              duration: Duration(seconds: 2), // Duration to display the message
            ),
          );
          Get.to(() => const TabScreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registered failed'),
              duration: Duration(seconds: 2), // Duration to display the message
            ),
          );
        }

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: defPadding,
          ),
          Text(
            'Sign up',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            width: defPadding,
          ),
           FaIcon(FontAwesomeIcons.arrowRight,
              color: Colors.white,
            size: height * 0.024,
          ),
        ],
      ),
    ),
  );
}