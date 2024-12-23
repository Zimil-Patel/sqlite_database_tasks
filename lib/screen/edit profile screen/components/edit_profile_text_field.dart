import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/screen/register%20screen/components/custom_text_field.dart';
import 'package:sqlite_database_tasks/utils.dart';


class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  $hintText',
          style: TextStyle(fontSize: height * 0.018, color: Colors.grey),
        ),
        buildTextField(icon: icon, hintText: hintText, controller: controller),
      ],
    );
  }
}
