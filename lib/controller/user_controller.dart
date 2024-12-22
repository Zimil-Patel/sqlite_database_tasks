import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  void clearController() {
    txtFirstName.clear();
    txtLastName.clear();
    txtEmail.clear();
    txtPassword.clear();
    txtPhone.clear();
  }


}