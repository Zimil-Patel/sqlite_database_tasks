import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/screen/edit%20profile%20screen/components/save_button.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'components/edit_profile_text_field.dart';
import 'components/gender_radio_button.dart';
import 'components/profile_picture_circle.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE PICTURE
              const ProfilePictureCircle(),

              // FIRST NAME LAST NAME ROW
              Row(
                children: [
                  Expanded(
                    child: EditProfileTextField(
                      icon: Icons.person,
                      hintText: 'First name',
                      controller: userController.txtFirstName,
                    ),
                  ),
                  const SizedBox(
                    width: defPadding,
                  ),
                  Expanded(
                    child: EditProfileTextField(
                      icon: Icons.person_outline_rounded,
                      hintText: 'Last name',
                      controller: userController.txtLastName,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: defPadding),

              // EMAIL
              EditProfileTextField(
                icon: Icons.email,
                hintText: 'Email',
                controller: userController.txtEmail,
              ),


              const SizedBox(height: defPadding),

              // PHONE
              EditProfileTextField(
                icon: Icons.phone,
                hintText: 'Phone',
                controller: userController.txtPhone,
              ),

              const SizedBox(height: defPadding),

              // PHONE
              EditProfileTextField(
                icon: Icons.person,
                hintText: 'Age',
                controller: userController.txtAge,
              ),

              const SizedBox(height: defPadding),

              // GENDER
              const GenderRadioButton(),


              // SAVE BUTTON
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

