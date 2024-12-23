import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/model/user_model.dart';

class UserController extends GetxController {

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  Uint8List? image;
  RxList<UserModel> userList = <UserModel>[].obs;

  void clearController() {
    txtFirstName.clear();
    txtLastName.clear();
    txtEmail.clear();
    txtPassword.clear();
    txtPhone.clear();
  }




}