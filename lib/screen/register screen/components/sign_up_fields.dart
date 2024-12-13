import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/screen/register%20screen/components/sign_up_button.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'custom_text_field.dart';
import 'divider_with_or_text.dart';
import 'google_apple_button.dart';

Widget singUpFields() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          // FIRST NAME
          Expanded(
            child: buildTextField(
              icon: Icons.person,
              hintText: 'First Name',
            ),
          ),
          const SizedBox(
            width: defPadding,
          ),

          // LAST NAME
          Expanded(
            child: buildTextField(
              icon: Icons.person_outline,
              hintText: 'Last Name',
            ),
          ),
        ],
      ),

      // EMAIL
      buildTextField(
        icon: Icons.email,
        hintText: 'Email',
        keyboardType: TextInputType.emailAddress,
      ),

      // PASSWORD
      buildTextField(
        icon: Icons.lock,
        hintText: 'Password',
        isObscure: true,
      ),

      // MOBILE NUMBER
      buildTextField(
        icon: Icons.phone,
        hintText: 'Mobile Number',
        keyboardType: TextInputType.phone,
      ),

      const SizedBox(height: 32),

      // SIGNUP BUTTONS
      signUpButton(),

      const SizedBox(height: 16),

      Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Already have account?',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: height * 0.014,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: Colors.white54),
              ),
            ),
            const SizedBox(
              width: defPadding / 2,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {  },
              child: Text(
                'Sign in',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: height * 0.014,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 16),

      // DIVIDER WITH OR TEXT
      dividerWithORText(),

      const SizedBox(
        height: defPadding,
      ),

      // CONTINUE WITH GOOGLE BUTTON
      googleButton(),

      const SizedBox(
        height: defPadding,
      ),

      // CONTINUE WITH APPLE BUTTON
      appleButton(),
    ],
  );
}
